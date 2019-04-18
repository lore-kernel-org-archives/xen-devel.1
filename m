From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] Add Undervolt MSRs to wrmsr function.
Date: Thu, 18 Apr 2019 12:12:05 +0100
Message-ID: <660adf6f-a574-d1cb-44a3-871b8d076a54@citrix.com>
References: <20190418085634.3629-1-dylanger@thegrail.co>
 <53b32c69-b0b4-5441-c8e2-299769eabf8f@citrix.com>
 <CANJ4vQ1nOuFZw0kk0dWEsx4Q0h8YE2H8gRzg422cRf65FAkncg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OZB7=SU=citrix.com=prvs=004a5fe52=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hH4xk-0007mg-4b
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 11:12:16 +0000
In-Reply-To: <CANJ4vQ1nOuFZw0kk0dWEsx4Q0h8YE2H8gRzg422cRf65FAkncg@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dylanger Daly <dylanger@thegrail.co>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMjAxOSAxMDoxOSwgRHlsYW5nZXIgRGFseSB3cm90ZToKPiBObyB3b3JyaWVzIEFu
ZHJldywgaXQgd2FzIG15IGZpcnN0IHBhdGNoLCB0aGFuayB5b3UgZm9yIHRoZSByZXNwb25zZS4K
Pgo+IEl0J3MgYmFzZWQgb24gWGVuIDQuOAo+Cj4gRG9tMCBzaG91bGQgYmUgY29udHJvbGxpbmcg
aXQsIGJ1dCBJIHdhc24ndCBhd2FyZSBvZiB0aGUgU2VjdXJpdHkKPiBpbXBsaWNhdGlvbnMuCj4K
PiBUaGUgc2NvcGUgaXNuJ3Qgd2VsbCBkb2N1bWVudGVkOgo+IMKgaHR0cHM6Ly9yZXNzbWFuLm9y
Zy9wb3N0cy8yMDE4LTA2LTI2LXZvbHRhZ2UtdGVtcGVyYXR1cmUtdGRwLXRoaW5rcGFkLwo+Cj4g
TW9yZSBleHBlcmltZW50YWwgYXMgaXQgd29ya2VkIHdpdGggbXkgTGFwdG9wLgoKV2hpY2ggQ1BV
IGV4YWN0bHk/CgpNU1JfVEVNUEVSQVRVUkVfVEFSR0VUIGlzIGRvY3VtZW50ZWQuwqAgSXQgaGFz
IHBhY2thZ2Ugc2NvcGUsIGJ1dCB0aGUKYXZhaWxhYmlsaXR5IG9mIGNlcnRhaW4gZmllbGRzIGlz
IG1vZGVsIHNwZWNpZmljIChidXQgY29uc2lzdGVudCwgYXQgbGVhc3QpLgoKSSBjYW4ndCBmaW5k
IGFueSBkb2N1bWVudGF0aW9uIG9uIE1TUiAxNTAgYXQgYWxsLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
