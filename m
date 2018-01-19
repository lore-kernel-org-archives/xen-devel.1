From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH 1/6] x86: move invocations of
	hvm_flush_guest_tlbs()
Date: Fri, 19 Jan 2018 17:29:42 +0000
Message-ID: <CAFLBxZbFP=mPWe6ah3njGBYrMeqnPATie5-TJ4V5WAMF2=U_ew@mail.gmail.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6224C302000078001A0788@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xl7c=eo=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ecc9f-0006ea-HK
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 19:16:47 +0000
Received: by mail-qt0-f195.google.com with SMTP id d54so6393537qtd.4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2018 11:16:41 -0800 (PST)
In-Reply-To: <5A6224C302000078001A0788@prv-mh.provo.novell.com>
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

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgNDowMiBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPiBUaGVpciBuZWVkIGlzIG5vdCB0aWVkIHRvIHRoZSBhY3R1YWwgZmx1
c2hpbmcgb2YgVExCcywgYnV0IHRoZSB0aWNraW5nCj4gb2YgdGhlIFRMQiBjbG9jay4gTWFrZSB0
aGlzIG1vcmUgb2J2aW91cyBieSBmb2xkaW5nIHRoZSB0d28gaW52b2NhdGlvbnMKPiBpbnRvIGEg
c2luZ2xlIG9uZSBpbiBwcmVfZmx1c2goKS4KClNvIG5vdyBwcmVfZmx1c2goKSBhY3R1YWxseSBk
b2VzIHRoZSBmbHVzaD8KCkkgZG9uJ3Qgb2JqZWN0IHRvIHRoZSBjaGFuZ2UgcGVyIHNlIChhbmQg
ZnJvbSB3aGF0IEkgY2FuIHRlbGwgaXQncwp0ZWNobmljYWxseSBjb3JyZWN0KSwgYnV0IEkgdGhp
bmsgeW91J3JlIG1ha2luZyB0aGluZ3MgYW55IGNsZWFyZXIuCgogLUdlb3JnZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
