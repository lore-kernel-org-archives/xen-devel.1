From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Thu, 8 Nov 2018 18:27:54 +0000
Message-ID: <20181108182754.4wl7iyfqxvypmazq@zion.uk.xensource.com>
References: <20181105095354.9082-1-aisaila@bitdefender.com>
 <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
 <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
 <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
 <af75d830-5a6f-f514-1eca-adce268964fd@bitdefender.com>
 <20181108180231.53r2exdgeepiy56t@zion.uk.xensource.com>
 <4bf400ee-9c3e-a9ac-5a12-149ad5c6e8db@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKp2X-0001qC-AC
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 18:28:25 +0000
Content-Disposition: inline
In-Reply-To: <4bf400ee-9c3e-a9ac-5a12-149ad5c6e8db@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDg6MjI6MDZQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDExLzgvMTggODowMiBQTSwgV2VpIExpdSB3cm90ZToKPiA+IFNwZWFraW5n
IG9mIGJ1aWxkIGJyZWFrYWdlOiB3b3VsZCB5b3UgZ3V5cyBjb25zaWRlciBzaWduaW5nIHVwIHRv
IGdpdGxhYgo+ID4gc28gdGhhdCB5b3UgY2FuIHVzZSBhbGwgdGhlIGJ1aWxkIHRlc3QgaW5mcmFz
dHJ1Y3R1cmUgdGhlcmUgYmVmb3JlCj4gPiBzdWJtaXNzaW9uPyBJdCB3b3VsZCBwcm9iYWJseSBz
YXkgeW91IGZyb20gYnVpbGRpbmcgbG9jYWwgZm9yIGRpZmZlcmVudAo+ID4gZGlzdHJvcyBhbmQg
Y29uZmlncy4KPiA+IAo+ID4gU2VlIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4v
cGlwZWxpbmVzLzM1OTE4NTEwCj4gCj4gWWVzLCB0aGF0IGRvZXMgc291bmQgdmVyeSBpbnRlcmVz
dGluZy4gSSdtIG5vdCBzdXJlIHdoYXQgdGhhdCBlbnRhaWxzIC8KPiB3aGF0IHRoZSBwcm9jZWR1
cmUgaXMgdGhvdWdoLiBDb3VsZCB5b3UgcGxlYXNlIHRlbGwgdXMgbW9yZT8KClRoZSBvbmUgSSBz
aG93ZWQgeW91IGlzIHRoZSB0b3AtbGV2ZWwgcGlwZWxpbmUuIFRoZXJlIGFyZSBwZXItYWNjb3Vu
dApwaXBlbGluZXMgYXMgd2VsbC4KClRvIHVzZSB0aGF0OgoKMS4gUmVnaXN0ZXIgYSBHaXRsYWIu
Y29tIGFjY291bnQKMi4gVGVsbCBtZSB5b3VyIGhhbmRsZShzKSwgSSB3aWxsIG1ha2UgeW91IG1l
bWJlciBvZiB0aGUgeGVuLXByb2plY3Qgb3JnCjMuIENyZWF0ZSB5b3VyIG93biBzdWJncm91cCB1
bmRlciBwZW9wbGUvCjQuIEZvcmsgeGVuLmdpdCBmcm9tIHhlbi1wcm9qZWN0IHRvcC1sZXZlbCBy
ZXBvc2l0b3J5IGludG8geW91ciBzdWJncm91cAo1LiBQdXNoIHlvdXIgYnJhbmNoIHRvIHlvdXIg
cmVwb3NpdG9yeQo2LiBGb3VuZCB0aGUgcmVzdWx0IG9mIHBpcGVsaW5lIHJ1biB1bmRlciBVUkwg
bGlrZToKICAgaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9saXV3L3hlbi9w
aXBlbGluZXMKICAgKHlvdXIgcHJvYmFibHkgY2FuJ3QgYWNjZXNzIGl0IGJlY2F1c2UgaXQgaXMg
cHJpdmF0ZSkKCldlaS4KCj4gCj4gCj4gVGhhbmtzLAo+IFJhenZhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
