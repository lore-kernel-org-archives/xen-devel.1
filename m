From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] build: sync Kconfig with Linux v4.17
Date: Thu, 21 Jun 2018 09:45:59 +0200
Message-ID: <20180621074559.z6suiorav6okt5gh@mac.bytemobile.com>
References: <20180621021052.27070-1-dougtrav@icloud.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uiai=jh=citrix.com=prvs=703afe70e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fVuIG-0005jA-4s
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 07:46:12 +0000
Content-Disposition: inline
In-Reply-To: <20180621021052.27070-1-dougtrav@icloud.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: dougtrav@icloud.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjEsIDIwMTggYXQgMTA6MTA6NTJBTSArMDgwMCwgZG91Z3RyYXZAaWNsb3Vk
LmNvbSB3cm90ZToKPiBGcm9tOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4g
Cj4gRnJvbTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgo+IAo+IEltcG9ydCB0
aGUgZm9sbG93aW5nIGZpbGVzIGFuZCBkaXJlY3RvcmllcyBmcm9tIHRoZSBMaW51eCB2NC4xNyB0
YWcKPiAoY29tbWl0IGlkIDI5ZGNlYTg4Nzc5Yzg1NmM3ZGM5MjA0MGEwYzAxMjMzMjYzMTAxZDQp
Ogo+IC0gc2NyaXB0cy9rY29uZmlnLyAtPiB4ZW4vdG9vbHMva2NvbmZpZy8KPiAtIHNjcmlwdHMv
TWFrZWZpbGUuaG9zdCAtPiB4ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5ob3N0Cj4gLSBEb2N1
bWVudGF0aW9uL2tidWlsZC9rY29uZmlneywtbGFuZ3VhZ2V9LnR4dCAtPgo+ICAgZG9jcy9taXNj
L2tjb25maWd7LWxhbmd1YWdlfS50eHQKPiAtIGluY2x1ZGUvbGludXgva2NvbmZpZy5oIC0+IHhl
bi9pbmNsdWRlL3hlbi9rY29uZmlnLmgKPiAKPiBQdWxsZWQgaW4gcGFydHMgb2Ygc2NyaXB0cy9N
YWtlZmlsZS5saWIgaW50bwo+IHhlbi90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcKPiAK
PiBTaWRlIGVmZmVjdCBvZiB0aGlzIGNoYW5nZSBpcyB0aGF0IGZsZXggYW5kIGJpc29uIGFyZSBy
ZXF1aXJlZCB0byBidWlsZAo+IEtjb25maWcuIExpbnV4IGhhcyBzd2l0Y2hlZCBmcm9tIHNoaXBw
aW5nIHRoZSBwcmUtZ2VuZXJhdGVkIGZpbGVzIHRvCj4gYWx3YXlzIGdlbmVyYXRpbmcgdGhlbSB3
aXRoIGZsZXggYW5kIGJpc29uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxj
YXJkb2VAY2FyZG9lLmNvbT4KClRlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CgpPbiBGcmVlQlNEIHdpdGggYmlzb24gZnJvbSBwb3J0cyBhbmQgZmxleCBm
cm9tIGJhc2UgKG5vdGUgdGhhdCBmbGV4CnVzZXMgYSBCU0QgbGljZW5zZSBhbmQgaXMgbm90IHBh
cnQgb2YgdGhlIEdOVSBwcm9qZWN0KS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
