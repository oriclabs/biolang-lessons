# BDSR lung-cancer survival

This strict-fidelity lesson ports the lung-cancer worked example from BDSR sections 9.2.2–9.2.3. It includes the complete original `survival::lung` data, matches the source Kaplan–Meier results and parameters, and preserves all three selected source figures byte for byte.

Run from this directory:

```powershell
bl notebook lesson.bln
cd tests
bl test validate.bl
```

See `SOURCE_MAP.md` for the exact boundary of the port and `ATTRIBUTION.md` for the CC BY-NC and LGPL terms.
