From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 5/8] x86/mm: split p2m ioreq server pages
 special handling into helper
Date: Mon, 18 Feb 2019 12:40:52 +0000
Message-ID: <2069a7f9-49be-4fc5-bfa2-e70bc3d847e4@citrix.com>
References: <20190215141837.1420-1-roger.pau@citrix.com>
 <20190215141837.1420-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KgNY=QZ=citrix.com=prvs=94518ece3=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gviEH-0001CM-Fw
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 12:41:01 +0000
In-Reply-To: <20190215141837.1420-6-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xNS8xOSAyOjE4IFBNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gU28gdGhhdCBpdCBj
YW4gYmUgc2hhcmVkIGJ5IGJvdGggZXB0LCBucHQgYW5kIHNoYWRvdyBjb2RlLCBpbnN0ZWFkIG9m
Cj4gZHVwbGljYXRpbmcgaXQuCj4gCj4gTm8gY2hhbmdlIGluIGZ1bmN0aW9uYWxpdHkgaW50ZW5k
ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+CgpUaGVyZSdzIHBhcnQgb2YgbWUgdGhhdCBmZWVscyBsaWtlIHRoaXMgcGF0Y2ggd2FudHMg
c29tZSBBU1NFUlRzIG9yCnNvbWV0aGluZzsgYnV0IGFzIHRoZXkncmUgYWRkZWQgaW4gbGF0ZXIg
b24sIGFuZCBldmVyeXRoaW5nIGVsc2UgbG9va3MgZ29vZDoKClJldmlld2VkLWJ5OiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
