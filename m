From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v1] xen/arm: Add MVEBU UART driver for
 Armada 3700 SoC
Date: Wed, 21 Mar 2018 17:09:10 +0000
Message-ID: <20180321170910.3kfx4kzlproxxwle@citrix.com>
References: <1521221662-6782-1-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyhG0-0002cC-6h
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 17:10:36 +0000
Content-Disposition: inline
In-Reply-To: <1521221662-6782-1-git-send-email-amittomer25@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Singh Tomar <amittomer25@gmail.com>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com, julien.grall@arm.com, andrew.cooper3@citrix.com, jbeulich@suse.com, andre.przywara@arm.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTYsIDIwMTggYXQgMTE6MDQ6MjJQTSArMDUzMCwgQW1pdCBTaW5naCBUb21h
ciB3cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9tdmVidS11YXJ0LmMgYi94
ZW4vZHJpdmVycy9jaGFyL212ZWJ1LXVhcnQuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMC4uYzg4ZDVlNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vZHJpdmVycy9j
aGFyL212ZWJ1LXVhcnQuYwo+IEBAIC0wLDAgKzEsMjYwIEBACj4gKy8qCj4gKyAqIHhlbi9kcml2
ZXJzL2NoYXIvbXZlYnUzNzAwLXVhcnQuYwo+ICsgKgo+ICsgKiBEcml2ZXIgZm9yIE1hcnZlbGwg
TVZFQlUgVUFSVC4KPiArICoKPiArICogQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21h
aWwuY29tPgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTguCj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
Cj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgYXMgcHVibGlzaGVkIGJ5Cj4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVp
dGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4gKyAqIChhdCB5b3VyIG9wdGlvbikg
YW55IGxhdGVyIHZlcnNpb24uCj4gKyAqCgpQaWNraW5nIHdoaWNoIGxpY2VuY2UgaXMgZW50aXJl
bHkgdXAgdG8geW91LiBCdXQgbWF5IEkgc3VnZ2VzdCB5b3UgdXNlCnRoZSBzZWN0aW9uIGluIENP
TlRSSUJVVElORyBmaWxlPyBUaGUgbmV3IGh5cGVydmlzb3IgY29kZSBpcyBub3JtYWxseQpHUEwg
djIgb25seS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
