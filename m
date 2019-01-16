From: Hans van Kranenburg <hans@knorrie.org>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Wed, 16 Jan 2019 01:26:39 +0100
Message-ID: <679672d3-c106-82bc-cfb4-08e61dcbad5f__29950.7562689998$1547598425$gmane$org@knorrie.org>
References: <20190114124413.3742-1-jgross@suse.com>
 <93146de6-24ec-c914-2d1e-718762f97d65@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dpa/=PY=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1gjZ32-0008As-Fg
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 00:27:12 +0000
In-Reply-To: <93146de6-24ec-c914-2d1e-718762f97d65@oracle.com>
Content-Language: en_US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, stable@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

SGkgQm9yaXMsCgpPbiAxLzE0LzE5IDI6NTQgUE0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBP
biAxLzE0LzE5IDc6NDQgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IENvbW1pdCBmOTRjOGQx
MTY5OTc1OSAoInNjaGVkL2Nsb2NrLCB4ODYvdHNjOiBSZXdvcmsgdGhlIHg4NiAndW5zdGFibGUn
Cj4+IHNjaGVkX2Nsb2NrKCkgaW50ZXJmYWNlIikgYnJva2UgWGVuIGd1ZXN0IHRpbWUgaGFuZGxp
bmcgYWNyb3NzCj4+IG1pZ3JhdGlvbjoKPj4KPj4gWyAgMTg3LjI0OTk1MV0gRnJlZXppbmcgdXNl
ciBzcGFjZSBwcm9jZXNzZXMgLi4uIChlbGFwc2VkIDAuMDAxIHNlY29uZHMpIGRvbmUuCj4+IFsg
IDE4Ny4yNTExMzddIE9PTSBraWxsZXIgZGlzYWJsZWQuCj4+IFsgIDE4Ny4yNTExMzddIEZyZWV6
aW5nIHJlbWFpbmluZyBmcmVlemFibGUgdGFza3MgLi4uIChlbGFwc2VkIDAuMDAxIHNlY29uZHMp
IGRvbmUuCj4+IFsgIDE4Ny4yNTIyOTldIHN1c3BlbmRpbmcgeGVuc3RvcmUuLi4KPj4gWyAgMTg3
LjI2Njk4N10geGVuOmdyYW50X3RhYmxlOiBHcmFudCB0YWJsZXMgdXNpbmcgdmVyc2lvbiAxIGxh
eW91dAo+PiBbMTg0NDY3NDM4MTEuNzA2NDc2XSBPT00ga2lsbGVyIGVuYWJsZWQuCj4+IFsxODQ0
Njc0MzgxMS43MDY0NzhdIFJlc3RhcnRpbmcgdGFza3MgLi4uIGRvbmUuCj4+IFsxODQ0Njc0Mzgx
MS43MjA1MDVdIFNldHRpbmcgY2FwYWNpdHkgdG8gMTY3NzcyMTYKPj4KPj4gRml4IHRoYXQgYnkg
c2V0dGluZyB4ZW5fc2NoZWRfY2xvY2tfb2Zmc2V0IGF0IHJlc3VtZSB0aW1lIHRvIGVuc3VyZSBh
Cj4+IG1vbm90b25pYyBjbG9jayB2YWx1ZS4KPj4KPj4gRml4ZXM6IGY5NGM4ZDExNjk5NzU5ICgi
c2NoZWQvY2xvY2ssIHg4Ni90c2M6IFJld29yayB0aGUgeDg2ICd1bnN0YWJsZScgc2NoZWRfY2xv
Y2soKSBpbnRlcmZhY2UiKQo+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNC4xMQo+
PiBSZXBvcnRlZC1ieTogSGFucyB2YW4gS3JhbmVuYnVyZyA8aGFuc0Brbm9ycmllLm9yZz4KPj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IFJldmll
d2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKQ2Fu
IHlvdSBwbGVhc2UgY2hhbmdlIHRoZSBhZGRyZXNzIHRvIG15IHdvcmsgZW1haWw/CgpSZXBvcnRl
ZC1ieTogSGFucyB2YW4gS3JhbmVuYnVyZyA8aGFucy52YW4ua3JhbmVuYnVyZ0BtZW5kaXguY29t
PgoKQWxzbyAoc2VlIG90aGVyIGVtYWlsKToKClRlc3RlZC1ieTogSGFucyB2YW4gS3JhbmVuYnVy
ZyA8aGFucy52YW4ua3JhbmVuYnVyZ0BtZW5kaXguY29tPgoKVGhhbmtzLApIYW5zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
