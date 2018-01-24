From: "Bitweasil ." <bitweasil@cryptohaze.com>
Subject: Xen Introspection, KPTI,
 and CR3 bit 63 leads to guest VMENTRY failures during introspection
Date: Wed, 24 Jan 2018 15:31:23 -0700
Message-ID: <CALn24pArgwLSBy7TO0j4gcqXdzJ5pqmW_koKP7-Lfg8FXrOZEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7733618401860082060=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: andrew.cooper3@citrix.com, tamas@tklengyel.com, rcojocaru@bitdefender.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

--===============7733618401860082060==
Content-Type: multipart/alternative; boundary="089e08250ea82a53d205638d3943"

--089e08250ea82a53d205638d3943
Content-Type: text/plain; charset="UTF-8"

I've recently discovered that if you attempt to use introspection to
capture CR3 changes with the new KPTI enabled kernels, the guest dies
shortly after the start of introspection with failed VM entry due to
invalid guest state.

I believe the invalid state here is the high bit being set in CR3 - while
this is how one indicates that PCID should not invalidate the various page
table caches, introspection leads to this being set in the VMCS, which
appears to be wrong.

With the XenServer 4.7.1 code base (which is my working code base at the
moment), I have not found a way around this, as the vm_event_set_registers
function (xen/arch/x86/vm_event.c) does not set the CR3 value, and
vm_event_register_write_resume only allows inhibiting the write, not
writing a modified value.

I've attempted several ways to work around this with a livepatch, and have
not (yet) been successful.

Masking at the top of hvm_set_cr3 allows the guest to continue, but appears
to do the wrong thing with regards to the guest (tasks begin dying quickly
from invalid opcode errors).

In any case, Andrew mentions that this appears to still be an issue in
staging, so this likely needs addressing.  At this point in time, I believe
guests with KPTI enabled cannot be introspected if that introspection
involves capturing CR3 changes.

Please let me know if you need any more details on this issue!

-Bit


(XEN) [19458.318035] Failed vm entry (exit reason 0x80000021) caused by
invalid guest state (0).
(XEN) [19458.318042] ************* VMCS Area **************
(XEN) [19458.318050] *** Guest State ***
(XEN) [19458.318056] CR0: actual=0x000000008005003b,
shadow=0x0000000080050033, gh_mask=ffffffffffffffff
(XEN) [19458.318062] CR4: actual=0x0000000000362670,
shadow=0x0000000000360670, gh_mask=ffffffffffffffff
(XEN) [19458.318069] CR3 = 0x800000001ded7080
(XEN) [19458.318076] PDPTE0 = 0x0000000000020000  PDPTE1 =
0x000006f800150018
(XEN) [19458.318082] PDPTE2 = 0x0000000000000000  PDPTE3 =
0x000006f800150018
(XEN) [19458.318089] RSP = 0xffff880015b87f50 (0xffff880015b87f50)  RIP =
0xffffffff81845857 (0xffffffff81845857)
(XEN) [19458.318095] RFLAGS=0x00000082 (0x00000082)  DR7 =
0x0000000000000400
(XEN) [19458.318101] Sysenter RSP=0000000000000000
CS:RIP=0010:ffffffff8184a220
(XEN) [19458.318105]        sel  attr  limit   base
(XEN) [19458.318112]   CS: 0010 0a09b ffffffff 0000000000000000
(XEN) [19458.318119]   DS: 0000 1c000 ffffffff 0000000000000000
(XEN) [19458.318126]   SS: 0018 0c093 ffffffff 0000000000000000
(XEN) [19458.318133]   ES: 0000 1c000 ffffffff 0000000000000000
(XEN) [19458.318140]   FS: 0000 1c000 ffffffff 00007fde038ba700
(XEN) [19458.318147]   GS: 0000 1c000 ffffffff ffff88001ba00000
(XEN) [19458.318152] GDTR:            0000007f ffff88001ba0c000
(XEN) [19458.318158] LDTR: 0000 1c000 ffffffff 0000000000000000
(XEN) [19458.318164] IDTR:            00000fff ffffffffff574000
(XEN) [19458.318169]   TR: 0040 0008b 00002087 ffff88001ba048c0
(XEN) [19458.318175] EFER = 0x0000000000000000  PAT = 0x0407010600070106
(XEN) [19458.318179] PreemptionTimer = 0x00000000  SM Base = 0x00000000
(XEN) [19458.318185] DebugCtl = 0x0000000000000000  DebugExceptions =
0x0000000000000000
(XEN) [19458.318233] PerfGlobCtl = 0x0000000000000000  BndCfgS =
0x0000000000000000
(XEN) [19458.318297] Interruptibility = 00000000  ActivityState = 00000000
(XEN) [19458.318324] *** Host State ***
(XEN) [19458.318329] RIP = 0xffff82d0801ee100 (vmx_asm_vmexit_handler)  RSP
= 0xffff8300bfcfff90
(XEN) [19458.318333] CS=e008 SS=0000 DS=0000 ES=0000 FS=0000 GS=0000 TR=e040
(XEN) [19458.318335] FSBase=0000000000000000 GSBase=0000000000000000
TRBase=ffff82d08035e780
(XEN) [19458.318337] GDTBase=ffff82d0802d9000 IDTBase=ffff82d080357ce0
(XEN) [19458.318339] CR0=000000008005003b CR3=000000010f001000
CR4=00000000003526e0
(XEN) [19458.318341] Sysenter RSP=ffff8300bfcfffc0
CS:RIP=e008:ffff82d08022bb30
(XEN) [19458.318343] EFER = 0x0000000000000000  PAT = 0x0000050100070406
(XEN) [19458.318344] *** Control State ***
(XEN) [19458.318347] PinBased=0000003f CPUBased=b6a0e5fa
SecondaryExec=001014ea
(XEN) [19458.318348] EntryControls=000153ff ExitControls=008fefff
(XEN) [19458.318350] ExceptionBitmap=00060082 PFECmask=00000000
PFECmatch=00000000
(XEN) [19458.318352] VMEntry: intr_info=00000000 errcode=00000000
ilen=00000000
(XEN) [19458.318353] VMExit: intr_info=00000000 errcode=00000000
ilen=00000003
(XEN) [19458.318355]         reason=80000021 qualification=0000000000000000
(XEN) [19458.318357] IDTVectoring: info=00000000 errcode=00000000
(XEN) [19458.318359] TSC Offset = 0xffffd23bbd8772ac  TSC Multiplier =
0x0000000000000000
(XEN) [19458.318361] TPR Threshold = 0x00  PostedIntrVec = 0x00
(XEN) [19458.318365] EPT pointer = 0x000000010ee9501e  EPTP index = 0x0000
(XEN) [19458.318396] PLE Gap=00000080 Window=00001000
(XEN) [19458.318402] Virtual processor ID = 0xccd3 VMfunc controls =
0000000000000000
(XEN) [19458.318406] **************************************
(XEN) [19458.318412] domain_crash called from
vmx_vmexit_handler+0x4ab/0x19f5
(XEN) [19458.318417] Domain 15 (vcpu#0) crashed on cpu#0:
(XEN) [19458.318443] ----[ Xen-4.7.1-1.0  x86_64  debug=n  Not tainted ]----
(XEN) [19458.318448] CPU:    0
(XEN) [19458.318453] RIP:    0010:[<ffffffff81845857>]
(XEN) [19458.318458] RFLAGS: 0000000000000082   CONTEXT: hvm guest (d15v0)
(XEN) [19458.318466] rax: 800000001ded7080   rbx: 0000000000000000   rcx:
00007fde033ce730
(XEN) [19458.318470] rdx: 00000000000000fa   rsi: 0000000000000002   rdi:
00007ffd8ee85250
(XEN) [19458.318484] rbp: 00007ffd8ee85410   rsp: ffff880015b87f50   r8:
0000000000000000
(XEN) [19458.318498] r9:  0000000000000017   r10: 0000000000000000   r11:
0000000000000246
(XEN) [19458.318502] r12: 00007ffd8ee85250   r13: 0000000000000000   r14:
0000000000000004
(XEN) [19458.318525] r15: 000055a8503b3828   cr0: 0000000080050033   cr4:
0000000000360670
(XEN) [19458.318538] cr3: 800000001ded7080   cr2: 00007ffef290a090
(XEN) [19458.318552] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0018
cs: 0010

--089e08250ea82a53d205638d3943
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I&#39;ve recently discovered that if you attempt=
 to use introspection to capture CR3 changes with the new KPTI enabled kern=
els, the guest dies shortly after the start of introspection with failed VM=
 entry due to invalid guest state.<br><br></div>I believe the invalid state=
 here is the high bit being set in CR3 - while this is how one indicates th=
at PCID should not invalidate the various page table caches, introspection =
leads to this being set in the VMCS, which appears to be wrong.<br><br></di=
v>With the XenServer 4.7.1 code base (which is my working code base at the =
moment), I have not found a way around this, as the vm_event_set_registers =
function (xen/arch/x86/vm_event.c) does not set the CR3 value, and vm_event=
_register_write_resume only allows inhibiting the write, not writing a modi=
fied value.<br><div><div><br></div><div>I&#39;ve attempted several ways to =
work around this with a livepatch, and have not (yet) been successful.<br><=
/div><div><br></div><div>Masking at the top of hvm_set_cr3 allows the guest=
 to continue, but appears to do the wrong thing with regards to the guest (=
tasks begin dying quickly from invalid opcode errors).</div><div><br></div>=
<div>In any case, Andrew mentions that this appears to still be an issue in=
 staging, so this likely needs addressing.=C2=A0 At this point in time, I b=
elieve guests with KPTI enabled cannot be introspected if that introspectio=
n involves capturing CR3 changes.</div><div><br></div><div>Please let me kn=
ow if you need any more details on this issue!<br></div><div><br></div><div=
>-Bit<br></div><div><br><br>(XEN) [19458.318035] Failed vm entry (exit reas=
on 0x80000021) caused by invalid guest state (0).<br>(XEN) [19458.318042] *=
************ VMCS Area **************<br>(XEN) [19458.318050] *** Guest Sta=
te ***<br>(XEN) [19458.318056] CR0: actual=3D0x000000008005003b, shadow=3D0=
x0000000080050033, gh_mask=3Dffffffffffffffff<br>(XEN) [19458.318062] CR4: =
actual=3D0x0000000000362670, shadow=3D0x0000000000360670, gh_mask=3Dfffffff=
fffffffff<br>(XEN) [19458.318069] CR3 =3D 0x800000001ded7080<br>(XEN) [1945=
8.318076] PDPTE0 =3D 0x0000000000020000=C2=A0 PDPTE1 =3D 0x000006f800150018=
<br>(XEN) [19458.318082] PDPTE2 =3D 0x0000000000000000=C2=A0 PDPTE3 =3D 0x0=
00006f800150018<br>(XEN) [19458.318089] RSP =3D 0xffff880015b87f50 (0xffff8=
80015b87f50)=C2=A0 RIP =3D 0xffffffff81845857 (0xffffffff81845857)<br>(XEN)=
 [19458.318095] RFLAGS=3D0x00000082 (0x00000082)=C2=A0 DR7 =3D 0x0000000000=
000400<br>(XEN) [19458.318101] Sysenter RSP=3D0000000000000000 CS:RIP=3D001=
0:ffffffff8184a220<br>(XEN) [19458.318105]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sel=C2=A0 attr=C2=A0 limit=C2=A0=C2=A0 base<br>(XEN) [19458.31811=
2]=C2=A0=C2=A0 CS: 0010 0a09b ffffffff 0000000000000000<br>(XEN) [19458.318=
119]=C2=A0=C2=A0 DS: 0000 1c000 ffffffff 0000000000000000<br>(XEN) [19458.3=
18126]=C2=A0=C2=A0 SS: 0018 0c093 ffffffff 0000000000000000<br>(XEN) [19458=
.318133]=C2=A0=C2=A0 ES: 0000 1c000 ffffffff 0000000000000000<br>(XEN) [194=
58.318140]=C2=A0=C2=A0 FS: 0000 1c000 ffffffff 00007fde038ba700<br>(XEN) [1=
9458.318147]=C2=A0=C2=A0 GS: 0000 1c000 ffffffff ffff88001ba00000<br>(XEN) =
[19458.318152] GDTR:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0000007f ffff88001ba0c000<br>(XEN) [19458.318158] LDTR: 0000 1=
c000 ffffffff 0000000000000000<br>(XEN) [19458.318164] IDTR:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000fff ffffffffff5740=
00<br>(XEN) [19458.318169]=C2=A0=C2=A0 TR: 0040 0008b 00002087 ffff88001ba0=
48c0<br>(XEN) [19458.318175] EFER =3D 0x0000000000000000=C2=A0 PAT =3D 0x04=
07010600070106<br>(XEN) [19458.318179] PreemptionTimer =3D 0x00000000=C2=A0=
 SM Base =3D 0x00000000<br>(XEN) [19458.318185] DebugCtl =3D 0x000000000000=
0000=C2=A0 DebugExceptions =3D 0x0000000000000000<br>(XEN) [19458.318233] P=
erfGlobCtl =3D 0x0000000000000000=C2=A0 BndCfgS =3D 0x0000000000000000<br>(=
XEN) [19458.318297] Interruptibility =3D 00000000=C2=A0 ActivityState =3D 0=
0000000<br>(XEN) [19458.318324] *** Host State ***<br>(XEN) [19458.318329] =
RIP =3D 0xffff82d0801ee100 (vmx_asm_vmexit_handler)=C2=A0 RSP =3D 0xffff830=
0bfcfff90<br>(XEN) [19458.318333] CS=3De008 SS=3D0000 DS=3D0000 ES=3D0000 F=
S=3D0000 GS=3D0000 TR=3De040<br>(XEN) [19458.318335] FSBase=3D0000000000000=
000 GSBase=3D0000000000000000 TRBase=3Dffff82d08035e780<br>(XEN) [19458.318=
337] GDTBase=3Dffff82d0802d9000 IDTBase=3Dffff82d080357ce0<br>(XEN) [19458.=
318339] CR0=3D000000008005003b CR3=3D000000010f001000 CR4=3D00000000003526e=
0<br>(XEN) [19458.318341] Sysenter RSP=3Dffff8300bfcfffc0 CS:RIP=3De008:fff=
f82d08022bb30<br>(XEN) [19458.318343] EFER =3D 0x0000000000000000=C2=A0 PAT=
 =3D 0x0000050100070406<br>(XEN) [19458.318344] *** Control State ***<br>(X=
EN) [19458.318347] PinBased=3D0000003f CPUBased=3Db6a0e5fa SecondaryExec=3D=
001014ea<br>(XEN) [19458.318348] EntryControls=3D000153ff ExitControls=3D00=
8fefff<br>(XEN) [19458.318350] ExceptionBitmap=3D00060082 PFECmask=3D000000=
00 PFECmatch=3D00000000<br>(XEN) [19458.318352] VMEntry: intr_info=3D000000=
00 errcode=3D00000000 ilen=3D00000000<br>(XEN) [19458.318353] VMExit: intr_=
info=3D00000000 errcode=3D00000000 ilen=3D00000003<br>(XEN) [19458.318355]=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reason=3D80000021 qualific=
ation=3D0000000000000000<br>(XEN) [19458.318357] IDTVectoring: info=3D00000=
000 errcode=3D00000000<br>(XEN) [19458.318359] TSC Offset =3D 0xffffd23bbd8=
772ac=C2=A0 TSC Multiplier =3D 0x0000000000000000<br>(XEN) [19458.318361] T=
PR Threshold =3D 0x00=C2=A0 PostedIntrVec =3D 0x00<br>(XEN) [19458.318365] =
EPT pointer =3D 0x000000010ee9501e=C2=A0 EPTP index =3D 0x0000<br>(XEN) [19=
458.318396] PLE Gap=3D00000080 Window=3D00001000<br>(XEN) [19458.318402] Vi=
rtual processor ID =3D 0xccd3 VMfunc controls =3D 0000000000000000<br>(XEN)=
 [19458.318406] **************************************<br>(XEN) [19458.3184=
12] domain_crash called from vmx_vmexit_handler+0x4ab/0x19f5<br>(XEN) [1945=
8.318417] Domain 15 (vcpu#0) crashed on cpu#0:<br>(XEN) [19458.318443] ----=
[ Xen-4.7.1-1.0=C2=A0 x86_64=C2=A0 debug=3Dn=C2=A0 Not tainted ]----<br>(XE=
N) [19458.318448] CPU:=C2=A0=C2=A0=C2=A0 0<br>(XEN) [19458.318453] RIP:=C2=
=A0=C2=A0=C2=A0 0010:[&lt;ffffffff81845857&gt;]<br>(XEN) [19458.318458] RFL=
AGS: 0000000000000082=C2=A0=C2=A0 CONTEXT: hvm guest (d15v0)<br>(XEN) [1945=
8.318466] rax: 800000001ded7080=C2=A0=C2=A0 rbx: 0000000000000000=C2=A0=C2=
=A0 rcx: 00007fde033ce730<br>(XEN) [19458.318470] rdx: 00000000000000fa=C2=
=A0=C2=A0 rsi: 0000000000000002=C2=A0=C2=A0 rdi: 00007ffd8ee85250<br>(XEN) =
[19458.318484] rbp: 00007ffd8ee85410=C2=A0=C2=A0 rsp: ffff880015b87f50=C2=
=A0=C2=A0 r8:=C2=A0 0000000000000000<br>(XEN) [19458.318498] r9:=C2=A0 0000=
000000000017=C2=A0=C2=A0 r10: 0000000000000000=C2=A0=C2=A0 r11: 00000000000=
00246<br>(XEN) [19458.318502] r12: 00007ffd8ee85250=C2=A0=C2=A0 r13: 000000=
0000000000=C2=A0=C2=A0 r14: 0000000000000004<br>(XEN) [19458.318525] r15: 0=
00055a8503b3828=C2=A0=C2=A0 cr0: 0000000080050033=C2=A0=C2=A0 cr4: 00000000=
00360670<br>(XEN) [19458.318538] cr3: 800000001ded7080=C2=A0=C2=A0 cr2: 000=
07ffef290a090<br>(XEN) [19458.318552] ds: 0000=C2=A0=C2=A0 es: 0000=C2=A0=
=C2=A0 fs: 0000=C2=A0=C2=A0 gs: 0000=C2=A0=C2=A0 ss: 0018=C2=A0=C2=A0 cs: 0=
010<br><br></div></div></div>

--089e08250ea82a53d205638d3943--


--===============7733618401860082060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7733618401860082060==--
