From: cosmin <marin.cosmin@gmail.com>
Subject: Realloc VM's memory while running
Date: Mon, 12 Feb 2018 12:48:42 +0000
Message-ID: <CAECzRG9bDz4FQSKmbuvnbBEf4G-kcqe=v7ZAaFiGYFJ6KXcHHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5837771546591448063=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mct1=fg=gmail.com=marin.cosmin@srs-us1.protection.inumbo.net>)
 id 1elDXJ-0000RG-MC
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 12:48:45 +0000
Received: by mail-vk0-x235.google.com with SMTP id x203so8687546vkx.10
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2018 04:48:43 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5837771546591448063==
Content-Type: multipart/alternative; boundary="94eb2c07ce7e4d11fb0565034c62"

--94eb2c07ce7e4d11fb0565034c62
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am working in a project in which we try to switch domain's underlying
machine memory(MFNs) for another "chunk" of the same size while the VM is
running. This can be useful for example when a domain running a memory
intensive load experiences performance penalties(e.g: lot of cache misses);
by switching domain's memory for a "chunk" of memory that is
allocated(assuming the allocator is able to take into account the relation
between memory address and the cache lines) such that the number of misses
decreases.

The implementation is mostly done, however we have some issues that we're
stuck on, so I'm asking for some help.

So, the implementation works in the following way:
S1. Pause domain

S2. Allocate new memory for domain

S3. Setup the 'new P2M' table for the newly allocated memory using 'old
P2M' table (based on a 1-to-1 mapping of oldP2M[i] and newP2M[i]).

For this purpose the pages a domain owns are split into 3 types: PT, WR and
P2M - which in fact ar also WR pages but they store the P2M(using the
pfn_to_mfn_frame_list_list field of the shared data between Xen and
domains). Accordingly, WR pages need only to be copied to the corresponding
new page while PT and P2M pages require for each entry/element in the page
to find their mapping in the new P2M and write it down at the same entry
location on the PT or P2M page in the "new" memory.

S4. For each page copy old page's metadata information(like count and type
info) to the matching new page.

S5. Update the fields of domain's data structures pointing to MFNs (i.e.:
domain.arch.pirq_eoi_map_mfn,
domain.shared.arch.pfn_to_mfn_frame_list_list, vcpu.arch.[guest_table,
guest_table_user], vcpu.vcpu_info_mfn)

S6.  Release domain's old memory by using relinquish_memory() in a loop, in
a similar manner like in relinquish_resources() but for memory(L4, L3, L2)
only.

S7. Update M2P table to reflect the changes

S8. Assign the new memory pages to domain.

S9. Unpause the domain.

The problems we face:

P1. It seems that translation of PTs and P2Ms works well - we wrote some
test scripts dumping and comparing domain's memory before and after the
memory switch(in order for this test to work we pause domain from console
at the beginning of the test - the unpause_doimain function called in
implementation should have no effect). However, for some RAW pages, ~ 1% of
the total number of pages of a 64MB domain, we can see some differences in
their content.

The question is, does somebody else touch a domain's memory once it is
paused ?
It is a 1VCPU domain.

P2. Some of the old pages(~ 2-3%) doesn't seem to be released. It looks
that this happens due to count/type info constraints, with the following
error:

d0v1 Error pfn 42b625: rd = 1, od = 32756 caf = 1c00000000000000
taf=7400000000000001

I guess it is in response to a page_get on a page that does not belong to a
domain anymore, but that shouldn't normally happen ... or am I wrong ?

P3. Trying to connect to a domain's console after it has been unpaused
doesn't work. We also run ping, but machine is not reachable. How can we
debug this issue ? Are there any changes to be done in the PV OS(Linux)
running on the domain ? Our assumptions were that as long as the domain has
direct memory access and uses  P2M and M2P tables, the changes will be
visible to the OS.

Thank you in advance.

Cosmin

--94eb2c07ce7e4d11fb0565034c62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:times ne=
w roman,serif">Hi all,<br><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:times new roman,serif">I am working in a project in which we try=
 to switch domain&#39;s underlying machine memory(MFNs) for another &quot;c=
hunk&quot; of the same size while the VM is running. This can be useful for=
 example when a domain running a memory intensive load experiences performa=
nce penalties(e.g: lot of cache misses); by switching domain&#39;s memory f=
or a &quot;chunk&quot; of memory that is allocated(assuming the allocator i=
s able to take into account the relation between memory address and the cac=
he lines) such that the number of misses decreases.<br><br>The implementati=
on is mostly done, however we have some issues that we&#39;re stuck on, so =
I&#39;m asking for some help.<br><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:times new roman,serif">So, the implementation works in th=
e following way:<br></div><div class=3D"gmail_default" style=3D"font-family=
:times new roman,serif">S1. Pause domain<br><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:times new roman,serif">S2. Allocate new memory=
 for domain<br><br></div><div class=3D"gmail_default" style=3D"font-family:=
times new roman,serif">S3. Setup the &#39;new P2M&#39; table for the newly =
allocated memory using &#39;old P2M&#39; table (based on a 1-to-1 mapping o=
f oldP2M[i] and newP2M[i]). <br><br>For this purpose the pages a domain own=
s are split into 3 types: PT, WR and P2M - which in fact ar also WR pages b=
ut they store the P2M(using the pfn_to_mfn_frame_list_list field of the sha=
red data between Xen and domains). Accordingly, WR pages need only to be co=
pied to the corresponding new page while PT and P2M pages require for each =
entry/element in the page to find their mapping in the new P2M and write it=
 down at the same entry location on the PT or P2M page in the &quot;new&quo=
t; memory.<br></div><div class=3D"gmail_default" style=3D"font-family:times=
 new roman,serif"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:times new roman,serif">S4. For each page copy old page&#39;s metadata in=
formation(like count and type info) to the matching new page.<br><br></div>=
<div class=3D"gmail_default" style=3D"font-family:times new roman,serif">S5=
. Update the fields of domain&#39;s data structures pointing to MFNs (i.e.:=
 domain.arch.pirq_eoi_map_mfn, domain.shared.arch.pfn_to_mfn_frame_list_lis=
t, vcpu.arch.[guest_table, guest_table_user], vcpu.vcpu_info_mfn)<br><br></=
div><div class=3D"gmail_default" style=3D"font-family:times new roman,serif=
">S6.=C2=A0 Release domain&#39;s old memory by using relinquish_memory() in=
 a loop, in a similar manner like in relinquish_resources() but for memory(=
L4, L3, L2) only.=C2=A0 <br><br></div><div class=3D"gmail_default" style=3D=
"font-family:times new roman,serif">S7. Update M2P table to reflect the cha=
nges<br><br></div><div class=3D"gmail_default" style=3D"font-family:times n=
ew roman,serif">S8. Assign the new memory pages to domain.<br><br></div><di=
v class=3D"gmail_default" style=3D"font-family:times new roman,serif">S9. U=
npause the domain.<br><br></div><div class=3D"gmail_default" style=3D"font-=
family:times new roman,serif">The problems we face:<br><br></div><div class=
=3D"gmail_default" style=3D"font-family:times new roman,serif">P1. It seems=
 that translation of PTs and P2Ms works well - we wrote some test scripts d=
umping and comparing domain&#39;s memory before and after the memory switch=
(in order for this test to work we pause domain from console at the beginni=
ng of the test - the unpause_doimain function called in implementation shou=
ld have no effect). However, for some RAW pages, ~ 1% of the total number o=
f pages of a 64MB domain, we can see some differences in their content.<br>=
<br></div><div class=3D"gmail_default" style=3D"font-family:times new roman=
,serif">The question is, does somebody else touch a domain&#39;s memory onc=
e it is paused ? <br></div><div class=3D"gmail_default" style=3D"font-famil=
y:times new roman,serif">It is a 1VCPU domain.<br><br></div><div class=3D"g=
mail_default" style=3D"font-family:times new roman,serif">P2. Some of the o=
ld pages(~ 2-3%) doesn&#39;t seem to be released. It looks that this happen=
s due to count/type info constraints, with the following error:<br><br></di=
v><div class=3D"gmail_default" style=3D"font-family:times new roman,serif">=
d0v1 Error pfn 42b625: rd =3D 1, od =3D 32756 caf =3D 1c00000000000000 taf=
=3D7400000000000001<br><br></div><div class=3D"gmail_default" style=3D"font=
-family:times new roman,serif">I guess it is in response to a page_get on a=
 page that does not belong to a domain anymore, but that shouldn&#39;t norm=
ally happen ... or am I wrong ?<br><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:times new roman,serif">P3. Trying to connect to a domai=
n&#39;s console after it has been unpaused doesn&#39;t work. We also run pi=
ng, but machine is not reachable. How can we debug this issue ? Are there a=
ny changes to be done in the PV OS(Linux) running on the domain ? Our assum=
ptions were that as long as the domain has direct memory access and uses=C2=
=A0 P2M and M2P tables, the changes will be visible to the OS.<br></div><di=
v class=3D"gmail_default" style=3D"font-family:times new roman,serif"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:times new roman,seri=
f">Thank you in advance.<br><br></div><div class=3D"gmail_default" style=3D=
"font-family:times new roman,serif">Cosmin<br></div><div class=3D"gmail_def=
ault" style=3D"font-family:times new roman,serif"><br><br><br><br></div></d=
iv>

--94eb2c07ce7e4d11fb0565034c62--


--===============5837771546591448063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5837771546591448063==--
