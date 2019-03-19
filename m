From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] x86: don't allow clearing of
 TF_kernel_mode for other than 64-bit PV
Date: Tue, 19 Mar 2019 17:01:45 +0000
Message-ID: <0ce9d1f8-ca58-3f81-4975-7a70f5ab669f@citrix.com>
References: <5C868ED8020000780021D5BB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nNMe=RW=citrix.com=prvs=974eac730=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h6I7c-0006Nk-QO
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 17:01:52 +0000
In-Reply-To: <5C868ED8020000780021D5BB@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xMS8xOSA0OjM3IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBUaGUgZmxhZyBpcyByZWFs
bHkgb25seSBtZWFudCBmb3IgdGhvc2UsIGJvdGggSFZNIGFuZCAzMi1iaXQgUFYgdGVsbAo+IGtl
cm5lbCBmcm9tIHVzZXIgbW9kZSBiYXNlZCBvbiBDUEwvUlBMLiBSZW1vdmUgdGhlIGFsbC1xdWVz
dGlvbi1tYXJrcwo+IGNvbW1lbnQgYW5kIGxldCdzIGJlIG9uIHRoZSBzYWZlIHNpZGUgaGVyZSBh
bmQgYWxzbyBzdXBwcmVzcyBjbGVhcmluZwo+IGZvciAzMi1iaXQgUFYgKHRoaXMgaXNuJ3QgYSBm
YXN0IHBhdGggYWZ0ZXIgYWxsKS4KPiAKPiBSZW1vdmUgbm8gbG9uZ2VyIG5lY2Vzc2FyeSBpc19w
dl8zMmJpdF8qKCkgZnJvbSBzaF91cGRhdGVfY3IzKCkgYW5kCj4gc2hfd2Fsa19ndWVzdF90YWJs
ZXMoKS4gTm90ZSB0aGF0IHNoYWRvd19vbmVfYml0X2Rpc2FibGUoKSBhbHJlYWR5Cj4gYXNzdW1l
cyB0aGUgbmV3IGJlaGF2aW9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
