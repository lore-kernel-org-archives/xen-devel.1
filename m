From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/3] xen: Disable ARINC653 scheduler by
 default for non-DEBUG builds
Date: Mon, 5 Feb 2018 14:45:20 +0000
Message-ID: <1a3cf98e-32b1-7287-70ea-44ab1260b9ee@citrix.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
 <20180205113642.3174-3-george.dunlap@citrix.com>
 <5A786BD402000078001A53CA@prv-mh.provo.novell.com>
 <1517841721.8082.1.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=invn=e7=citrix.com=prvs=567d2a528=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eii1R-0007Vc-OE
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 14:45:29 +0000
In-Reply-To: <1517841721.8082.1.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMjAxOCAwMjo0MiBQTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gTW9uLCAy
MDE4LTAyLTA1IGF0IDA2OjM2IC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDUu
MDIuMTggYXQgMTI6MzYsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4KPj4+
IFRoZSBBUklOQzY1MyBzY2hlZHVsZXIgaXMgdGFyZ2V0ZWQgYXQgYSB2ZXJ5IHNwZWNpZmljIG5p
Y2hlOwo+Pj4gdHlwaWNhbAo+Pj4gdXNlcnMgY2Fubm90IGJlbmVmaXQgZnJvbSB1c2luZyBpdC4g
IERpc2FibGUgaXQgYnkgZGVmYXVsdCBmb3IKPj4+IG5vbi1ERUJVRyBidWlsZHMuCj4+Cj4+IFRo
ZSBtb3JlIHRoYXQgaXRzIHByb21wdCBzYXlzICIoRVhQRVJJTUVOVEFMKSIuCj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+Cj4+
IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4gUmV2aWV3ZWQt
Ynk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CgpKdXN0IHRvIGxldCBwZW9w
bGUga25vdywgSSB3YXMgcGxhbm5pbmcgb24gd2FpdGluZyBhdCBsZWFzdCBhIGZldyBkYXlzCmZv
ciB0aGUgbWFpbnRhaW5lcnMgb2YgdGhpcyBzY2hlZHVsZXIgdG8gZXhwcmVzcyBhbiBvcGluaW9u
IGJlZm9yZQpjaGVja2luZyBpdCBpbi4KCiAtR2VvcmVnCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
