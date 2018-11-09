From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/8] xen/page_alloc: Move
 get_pg_owner()/put_pg_owner() from x86 to common code
Date: Fri, 9 Nov 2018 18:06:23 +0000
Message-ID: <4c184df3-7115-0a1b-b65b-8b5251d558e3@arm.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-2-julien.grall@arm.com>
 <5BE2B05002000078001F8F8D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dfw9=nu=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gLBAq-0000NH-Fh
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 18:06:28 +0000
In-Reply-To: <5BE2B05002000078001F8F8D@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDcvMTEvMjAxOCAwOToyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDYuMTEuMTggYXQgMjA6MTQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEZyb206
IEJlbmphbWluIFNhbmRhIDxiZW4uc2FuZGFAZG9ybmVyd29ya3MuY29tPgo+Pgo+PiBnZXRfcGdf
b3duZXIoKSBhbmQgcHV0X3BnX293bmVyKCkgd2lsbCBiZSBuZWNlc3NhcnkgaW4gYSBmb2xsb3ct
dXAKPj4gY29tbWl0IHRvIHN1cHBvcnQgeGVudHJhY2Ugb24gQXJtLiBTbyBtb3ZlIHRoZSBoZWxw
ZXIgdG8gY29tbW9uIGNvZGUuCj4+Cj4+IE5vdGUgdGhhdCBwdXRfcGdfb3duZXIoKSBoYXMgYmVl
biB0dXJuZWQgdG8gYSBtYWNybyByYXRoZXIgdGhhbiBzdGF0aWMKPj4gaW5saW5lIGJlY2F1c2Ug
b2YgaW50ZXItZGVwZW5kZW5jeSBiZXR3ZWVuIGluY2x1ZGVzLgo+IAo+IENvdWxkIHRoaXMgYmUg
YXZvaWRlZCBieSBwbGFjaW5nIGJvdGggaW4gYSBkaWZmZXJlbnQgaGVhZGVyLAo+IGUuZy4gc2No
ZWQuaD8KVGhpcyBzZWVtcyB0byB3b3JrLiBJIHdpbGwgdXNlIHRoYXQgaW4gdGhlIG5leHQgdmVy
c2lvbi4KCj4gTWlkLXRlcm0gd2Ugc2hvdWxkIHByb2JhYmx5IHRyeSB0byBzcGxpdCBvdXQKPiB0
eXBlIChzdHJ1Y3R1cmUpIGRlY2xhcmF0aW9ucyBmcm9tIHNjaGVkLmgsIHRvIG1ha2UgaXQgZWFz
aWVyCj4gdG8gaGF2ZSBmdWxsIHR5cGVzIGF2YWlsYWJsZSB3aXRob3V0IGhhdmluZyB0byByZXNw
ZWN0IG90aGVyCj4gaW5jbHVkZSBkZXBlbmRlbmNpZXMuCgpUaGUgaW5jbHVkZSBkZXBlbmRlbmNp
ZXMgb24gWGVuIGlzIGEgYml0IG9mIGEgbmlnaHRtYXJlLiBJIGhhdmUgc3RhcnRlZCB0byBjbGVh
biAKaXQgdXAgb24gQXJtIGFuZCBJIHdpbGwgc3VwcG9ydCBhbnkgY2hhbmdlcyBpbiB0aGUgY29t
bW9uIGhlYWRlcnMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
