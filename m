From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v3 3/5] xen/arm: p2m: Add support
 for preemption in p2m_cache_flush_range
Date: Tue, 18 Dec 2018 17:47:18 +0000
Message-ID: <749dba20-2277-47cd-c397-7efd0a53d035@arm.com>
References: <20181214115855.6713-1-julien.grall@arm.com>
 <20181214115855.6713-4-julien.grall@arm.com>
 <alpine.DEB.2.10.1812141324330.14554@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v4z/=O3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gZJSk-0004rj-EU
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 17:47:22 +0000
In-Reply-To: <alpine.DEB.2.10.1812141324330.14554@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEyLzE0LzE4IDk6MjcgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBGcmksIDE0IERlYyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPj4gaW5kZXggMTdl
MjUyM2ZjMS4uNTYzOWU0YjY0YyAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+PiBAQCAtMTUyNCwxMyArMTUyNCwxNyBAQCBpbnQg
cmVsaW5xdWlzaF9wMm1fbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkKQo+PiAgICAgICByZXR1cm4g
cmM7Cj4+ICAgfQo+PiAgIAo+PiAtaW50IHAybV9jYWNoZV9mbHVzaF9yYW5nZShzdHJ1Y3QgZG9t
YWluICpkLCBnZm5fdCBzdGFydCwgZ2ZuX3QgZW5kKQo+PiAraW50IHAybV9jYWNoZV9mbHVzaF9y
YW5nZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCAqcHN0YXJ0LCBnZm5fdCBlbmQpCj4+ICAgewo+
PiAgICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+PiAg
ICAgICBnZm5fdCBuZXh0X2Jsb2NrX2dmbjsKPj4gKyAgICBnZm5fdCBzdGFydCA9ICpwc3RhcnQ7
Cj4+ICAgICAgIG1mbl90IG1mbiA9IElOVkFMSURfTUZOOwo+PiAgICAgICBwMm1fdHlwZV90IHQ7
Cj4+ICAgICAgIHVuc2lnbmVkIGludCBvcmRlcjsKPj4gKyAgICBpbnQgcmMgPSAwOwo+PiArICAg
IC8qIENvdW50ZXIgZm9yIHByZWVtcHRpb24gKi8KPj4gKyAgICB1bnNpZ25lZCBsb25nIGNvdW50
ID0gMDsKPiAKPiBObyBuZWVkIGZvciB1bnNpZ25lZCBsb25nLCBjb3VudCBjb3VsZCBiZSB1bnNp
Z25lZCBpbnQgb3IgZXZlbiB1bnNpZ25lZAo+IHNob3J0Lgo+IAo+IFdpdGggdGhpcyBjaGFuZ2U6
Cj4gCj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KCkkgd2lsbCB1c2UgdW5zaWduZWQgc2hvcnQgYW5kIGNvbW1pdCBpdC4KClRoYW5rIHlv
dSBmb3IgdGhlIHJldmlldyEKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
