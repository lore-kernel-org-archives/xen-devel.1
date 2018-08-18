From: Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH v3 5/5] x86: use PDEP for PTE flags
 insertion when available
Date: Fri, 17 Aug 2018 21:08:27 -0400
Message-ID: <B9ED55E9-8146-4202-84CD-6DE928E75D45@gmail.com>
References: <5AA7E79302000078001B0FAB@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F73C0@prv1-mh.provo.novell.com>
 <5AA7D98302000078001CDC8C@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F8008@prv1-mh.provo.novell.com>
 <5AA7D98302000078001DD5F0@prv1-mh.provo.novell.com>
 <5B76740802000078001DF345@prv1-mh.provo.novell.com>
 <5B76781702000078001DF38D@prv1-mh.provo.novell.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============4865817783663196547=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xf3e=lb=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1fqpjC-0008HO-2F
 for xen-devel@lists.xenproject.org; Sat, 18 Aug 2018 01:08:30 +0000
Received: by mail-it0-x231.google.com with SMTP id j81-v6so13715839ite.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Aug 2018 18:08:28 -0700 (PDT)
In-Reply-To: <5B76781702000078001DF38D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4865817783663196547==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-0041B1EF-36BA-42F0-8EC1-16B7608C7636
Content-Transfer-Encoding: 7bit


--Apple-Mail-0041B1EF-36BA-42F0-8EC1-16B7608C7636
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Aug 17, 2018, at 03:24, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> This replaces 5 instructions by a single one, further reducing code size,
> cache, and TLB footprint (in particular on systems supporting BMI2).

This link claims that BMI2 may be less performant/consistent on AMD Ryzen th=
an Intel:
https://www.reddit.com/r/Amd/comments/60i6er/ryzen_and_bmi2_strange_behavior=
_and_high_latencies/

Would this patch series have any benefit to L0 hypervisors/rootkits (e.g. Br=
omium, Bareflank or similar hypervisors) which could be monitoring L1 Xen?  O=
r Xen as L0 hypervisor and Hyper-V as L1 hypervisor?

Rich=

--Apple-Mail-0041B1EF-36BA-42F0-8EC1-16B7608C7636
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div></div><div>On Aug 17, 2018, at 03:24, J=
an Beulich &lt;<a href=3D"mailto:JBeulich@suse.com">JBeulich@suse.com</a>&gt=
; wrote:</div><div><br></div><blockquote type=3D"cite"><span>This replaces 5=
 instructions by a single one, further reducing code size,</span><br><span>c=
ache, and TLB footprint (in particular on systems supporting BMI2).</span><b=
r></blockquote><br><div>This link claims that BMI2 may be less performant/co=
nsistent on AMD Ryzen than Intel:</div><div><a href=3D"https://www.reddit.co=
m/r/Amd/comments/60i6er/ryzen_and_bmi2_strange_behavior_and_high_latencies/"=
>https://www.reddit.com/r/Amd/comments/60i6er/ryzen_and_bmi2_strange_behavio=
r_and_high_latencies/</a></div><div><br></div><div>Would this patch series h=
ave any benefit to L0 hypervisors/rootkits (e.g. Bromium, Bareflank or simil=
ar hypervisors) which could be monitoring L1 Xen? &nbsp;Or Xen as L0 hypervi=
sor and Hyper-V as L1 hypervisor?</div><div><br></div><div>Rich</div></body>=
</html>=

--Apple-Mail-0041B1EF-36BA-42F0-8EC1-16B7608C7636--


--===============4865817783663196547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4865817783663196547==--
