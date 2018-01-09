From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 4/4] xen: use per-vcpu TSS and stacks
	for pv domains
Date: Tue, 9 Jan 2018 18:40:49 +0100
Message-ID: <17111fe9-68d8-5082-385c-caa87e14d6eb@suse.com>
References: <20180109142700.12028-1-jgross@suse.com>
 <20180109142700.12028-5-jgross@suse.com>
 <3430712a-6b57-fd55-5cf0-727f9817d7da@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=fubw=ee=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eYxtT-0001i3-Jl
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 17:40:59 +0000
In-Reply-To: <3430712a-6b57-fd55-5cf0-727f9817d7da@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDEvMTggMTg6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDkvMDEvMTggMTQ6
MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEluc3RlYWQgb2YgdXNpbmcgdGhlIFRTUyBhbmQg
c3RhY2tzIG9mIHRoZSBwaHlzaWNhbCBwcm9jZXNzb3IgYWxsb2NhdGUKPj4gdGhlbSBwZXIgdmNw
dSwgbWFwIHRoZW0gaW4gdGhlIHBlciBkb21haW4gYXJlYSwgYW5kIHVzZSB0aG9zZS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IEkgZG9u
J3Qgc2VlIGFueXRoaW5nIGhlcmUgd2hpY2ggdXBkYXRlcyB0aGUgZmllbGRzIGluIHRoZSBUU1Mg
YWNyb3NzCj4gY29udGV4dCBzd2l0Y2guwqAgV2l0aG91dCBpdCwgeW91J2xsIGJlIHRha2luZyBO
TUlzL01DRXMvREYncyBvbiB0aGUKPiB3cm9uZyBzdGFjay4KCk5vLCBJJ20gZG9pbmcgbHRyKCkg
d2l0aCBhIFRTUyByZWZlcmVuY2luZyB0aGUgcGVyLXZjcHUgc3RhY2tzLiBUU1MgaXMKcGVyIHZj
cHUsIHRvby4KCj4gSSBzdGlsbCBkb24ndCBzZWUgaG93IHlvdXIgcGxhbiBpcyB2aWFibGUgaW4g
dGhlIGZpcnN0IHBsYWNlLCBhbmQgaXMKPiBhZGRpbmcgc3Vic3RhbnRpYWxseSBtb3JlIGNvbXBs
ZXhpdHkgdG8gYW4gYW5zd2VyIHdoaWNoIGRvZXNuJ3QgbmVlZCBpdC4KPiAKPiBJJ20gYWZyYWlk
IEknbSBvbiB0aGUgdmVyZ2Ugb2YgYSBuYWNrIHVubGVzcyB5b3UgY2FuIGV4cGxhaW4gaG93IGlz
Cj4gaW50ZW5kZWQgdG8gYmUgc2FmZSwgYW5kIGJldHRlciB0aGFuIHdoYXQgd2UgY3VycmVudGx5
IGhhdmUuCgpJdCBpcyBsYXlpbmcgdGhlIGdyb3VuZHdvcmsgZm9yIGEgS0FJU0VSIHNvbHV0aW9u
IG5lZWRpbmcgbm8gbWFwcGluZyBvZgpwZXIgcGh5c2ljYWwgY3B1IGFyZWFzIGluIHRoZSB1c2Vy
IGd1ZXN0IHRhYmxlcywgc28gaXNvbGF0aW5nIHRoZSBndWVzdHMKZnJvbSBlYWNoIG90aGVyLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
