From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] libx86: Introduce a helper to
 deserialise cpuid_policy objects
Date: Mon, 25 Feb 2019 11:41:21 +0000
Message-ID: <c83aff04-7c79-2899-d2d5-30507ee1df91@citrix.com>
References: <1546616022-32229-1-git-send-email-andrew.cooper3@citrix.com>
 <1546616022-32229-2-git-send-email-andrew.cooper3@citrix.com>
 <5C332F70020000780020AC8F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C332F70020000780020AC8F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOSAxMDo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS94
ZW4vbGliL3g4Ni9jcHVpZC5jIGIveGVuL2xpYi94ODYvY3B1aWQuYwo+PiBpbmRleCA1YTMxNTli
Li43ZmM0MTQ4IDEwMDY0NAo+PiAtLS0gYS94ZW4vbGliL3g4Ni9jcHVpZC5jCj4+ICsrKyBiL3hl
bi9saWIveDg2L2NwdWlkLmMKPj4gQEAgLTIzMyw2ICsyMzMsMTEyIEBAIGludCB4ODZfY3B1aWRf
Y29weV90b19idWZmZXIoY29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAKPj4gKnAsCj4+ICAgICAg
cmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gK2ludCB4ODZfY3B1aWRfY29weV9mcm9tX2J1ZmZlcihz
dHJ1Y3QgY3B1aWRfcG9saWN5ICpwLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IGNwdWlkX2xlYWZfYnVmZmVyX3QgbGVhdmVzLAo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQzMl90IG5yX2VudHJpZXMsIHVpbnQzMl90ICplcnJfbGVhZiwKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZXJyX3N1YmxlYWYpCj4+
ICt7Cj4+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4+ICsgICAgeGVuX2NwdWlkX2xlYWZfdCBkYXRh
Owo+PiArICAgIHN0cnVjdCBjcHVpZF9sZWFmICpsID0gKHZvaWQgKikmZGF0YS5hOwo+IEknZCBm
aW5kIHRoaXMgY2FzdCBhIGxpdHRsZSBsZXNzIHdvcnJ5aW5nIGlmIHlvdSB1c2VkIGNvbnRhaW5l
cl9vZigpLiBCdXQKPiBldmVuIHRoZW4gSSBkaXNsaWtlIHRoaXMgd2VsbCBoaWRkZW4gYXNzdW1w
dGlvbiBvZiBzaW1pbGFyIGxheW91dHMKPiBvZiBzdHJ1Y3QgY3B1aWRfbGVhZiBhbmQgdGhlIGxh
dHRlciBwYXJ0cyBvZiBzdHJ1Y3QgeGVuX2NwdWlkX2xlYWYuCj4KPiBBbHNvIGl0IGxvb2tzIGFz
IGlmIHRoaXMgY291bGQgYmUgYSBwb2ludGVyIHRvIGNvbnN0LgoKSSd2ZSBmb3VuZCBhIGRpZmZl
cmVudCB3YXkgb2YgZG9pbmcgdGhpcyB3aGljaCBhY3R1YWxseSBjb21waWxlcyBzbWFsbGVyCihj
b250cmFyeSB0byBleHBlY3RhdGlvbikuCgo+PiArICAgIC8qCj4+ICsgICAgICogQSB3ZWxsIGZv
cm1lZCBjYWxsZXIgaXMgZXhwZWN0ZWQgcGFzcyBhbiBhcnJheSB3aXRoIGxlYXZlcyBpbiBvcmRl
ciwKPiAuLi4gZXhwZWN0ZWQgdG8gcGFzcyAuLi4KCkZpeGVkLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
