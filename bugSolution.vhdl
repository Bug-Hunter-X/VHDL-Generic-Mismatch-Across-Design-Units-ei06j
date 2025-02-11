The solution involves ensuring consistent generic declarations and usage across all entities and architectures.  In the provided example, modify Entity B to use the correct generic from Entity A, thereby avoiding the mismatch:

**Corrected Entity B:**
```vhdl
entity entity_b is
  port (data_out : out std_logic_vector(7 downto 0));
end entity;

architecture behavioral of entity_b is
  signal internal_data : std_logic_vector(7 downto 0);
begin
  instance_a : entity work.entity_a
    port map (data_in => internal_data);  -- Correct: Use default generic value
  -- ...more logic... 
data_out <= internal_data;
end architecture;
```

Alternatively, if a different WIDTH is intentionally needed, ensure the corresponding ports and internal signals are adjusted accordingly in Entity B's architecture to match the new WIDTH.  Always double-check that generic values are consistently passed and that ports and signals are sized appropriately to avoid such discrepancies.