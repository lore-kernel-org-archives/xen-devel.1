From: Dylanger Daly <dylanger@thegrail.co>
Subject: Re: [PATCH] Add Undervolt MSRs to wrmsr function.
Date: Thu, 18 Apr 2019 12:54:21 +0100
Message-ID: <CANJ4vQ3TpPpqoiP5uXXVXjjUCkzwKYGTztCe2g34s_EUy2ghig@mail.gmail.com>
References: <20190418085634.3629-1-dylanger@thegrail.co>
 <53b32c69-b0b4-5441-c8e2-299769eabf8f@citrix.com>
 <CANJ4vQ1nOuFZw0kk0dWEsx4Q0h8YE2H8gRzg422cRf65FAkncg@mail.gmail.com>
 <660adf6f-a574-d1cb-44a3-871b8d076a54@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <660adf6f-a574-d1cb-44a3-871b8d076a54@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Dylanger Daly <dylanger@thegrail.co>, xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SSdtIHJ1bm5pbmcgYW4gaTctODU1MFUgb24gYSBIdWF3ZWkgTWF0ZWJvb2sgWCBQcm8uIFJ1bm5p
bmcgUXViZXMgT1MgSQp1c2VkIHRvIGlkbGUgfjYwQywgd2l0aCB0aGVzZSBNU1JzIGVuYWJsZWQs
IEkndmUgYmVlbiBhYmxlIHRvIGdldApzdGFibGUgfjQ1LTU1Qy4KCkknbSBub3QgdG9vIHN1cmUs
IGJ1dCBJIHRoaW5rIGl0IHdhcyByZXZlcnNlIGVuZ2luZWVyZWQgZnJvbSBJbnRlbCdzClhUVSBU
b29sLiBQZXJoYXBzIGl0J3MgYmVoaW5kIE5EQXM/IEknbSBub3QgdG9vIHN1cmUKCk1TUiAxNTAg
aXMgd2hlcmUgeW91J3JlIGFwcGx5aW5nIHRoZSBVbmRlcnZvbHQgVm9sdGFnZSBPZmZzZXRzLgoK
T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMTI6MTIgUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxOC8wNC8yMDE5IDEwOjE5LCBEeWxhbmdl
ciBEYWx5IHdyb3RlOgo+ID4gTm8gd29ycmllcyBBbmRyZXcsIGl0IHdhcyBteSBmaXJzdCBwYXRj
aCwgdGhhbmsgeW91IGZvciB0aGUgcmVzcG9uc2UuCj4gPgo+ID4gSXQncyBiYXNlZCBvbiBYZW4g
NC44Cj4gPgo+ID4gRG9tMCBzaG91bGQgYmUgY29udHJvbGxpbmcgaXQsIGJ1dCBJIHdhc24ndCBh
d2FyZSBvZiB0aGUgU2VjdXJpdHkKPiA+IGltcGxpY2F0aW9ucy4KPiA+Cj4gPiBUaGUgc2NvcGUg
aXNuJ3Qgd2VsbCBkb2N1bWVudGVkOgo+ID4gIGh0dHBzOi8vcmVzc21hbi5vcmcvcG9zdHMvMjAx
OC0wNi0yNi12b2x0YWdlLXRlbXBlcmF0dXJlLXRkcC10aGlua3BhZC8KPiA+Cj4gPiBNb3JlIGV4
cGVyaW1lbnRhbCBhcyBpdCB3b3JrZWQgd2l0aCBteSBMYXB0b3AuCj4KPiBXaGljaCBDUFUgZXhh
Y3RseT8KPgo+IE1TUl9URU1QRVJBVFVSRV9UQVJHRVQgaXMgZG9jdW1lbnRlZC4gIEl0IGhhcyBw
YWNrYWdlIHNjb3BlLCBidXQgdGhlCj4gYXZhaWxhYmlsaXR5IG9mIGNlcnRhaW4gZmllbGRzIGlz
IG1vZGVsIHNwZWNpZmljIChidXQgY29uc2lzdGVudCwgYXQgbGVhc3QpLgo+Cj4gSSBjYW4ndCBm
aW5kIGFueSBkb2N1bWVudGF0aW9uIG9uIE1TUiAxNTAgYXQgYWxsLgo+Cj4gfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
