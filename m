From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86: fix efi.lds dependency generation
Date: Mon, 19 Nov 2018 10:58:07 +0000
Message-ID: <20181119105807.65uo3y7o7adljhzd@zion.uk.xensource.com>
References: <20181119102547.17466-1-wei.liu2@citrix.com>
 <5BF2944302000078001FD62E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bhw3=N6=citrix.com=prvs=8540992c9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gOhMU-0007Jy-O0
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 11:05:02 +0000
Content-Disposition: inline
In-Reply-To: <5BF2944302000078001FD62E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDM6NDU6MjNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjExLjE4IGF0IDExOjI1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9NYWtlZmlsZQo+ID4gQEAgLTIzNCwxMiArMjM0LDEyIEBAICQoQkFTRURJUikvaW5jbHVkZS9h
c20teDg2L2FzbS1tYWNyb3MuaDogYXNtLW1hY3Jvcy5pIE1ha2VmaWxlCj4gPiAgCj4gPiAgeGVu
LmxkczogeGVuLmxkcy5TCj4gPiAgCSQoQ0MpIC1QIC1FIC1VaTM4NiAkKGZpbHRlci1vdXQgLVdh
JChjb21tYSklLCQoQUZMQUdTKSkgLW8gJEAgJDwKPiA+IC0Jc2VkIC1lICdzL3hlblwubGRzXC5v
Oi94ZW5cLmxkczovZycgPC54ZW4ubGRzLmQgPi54ZW4ubGRzLmQubmV3Cj4gPiArCXNlZCAtZSAn
cy8uKlwubGRzXC5vOi8kKEBGKTovZycgPC4kKEBGKS5kID4uJChARikuZC5uZXcKPiA+ICAJbXYg
LWYgLnhlbi5sZHMuZC5uZXcgLnhlbi5sZHMuZAo+IAo+IEhtbSwgb2theSwgdGhpcyBjYW4gYmUg
cmVsYXhlZCwgYnV0IEknbSBub3Qgc3VyZSBpdCdzIG5lZWRlZC4gQW55d2F5Cj4gQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rcy4KCj4gYWxiZWl0IGlmIHlv
dSBhbHJlYWR5IGJyaW5nIGJvdGggcnVsZXMgaW50byBjbG9zZXIgc3luYywgYWRqdXN0aW5nIHRo
ZSBsYXN0Cj4gbGluZSBhYm92ZSBhdCB0aGUgc2FtZSB0aW1lIHdvdWxkIGhhdmUgYmVlbiBuaWNl
LgoKQWxyaWdodC4gSSBjYW4gZm9sZCB0aGF0IGluIGFzIHdlbGwuCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
