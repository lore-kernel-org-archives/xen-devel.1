From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/vpci: validate data first in
 register_vpci_mmcfg_handler
Date: Tue, 27 Mar 2018 12:09:43 +0100
Message-ID: <20180327110943.nqpspkddqhnmduwg@MacBook-Pro-de-Roger.local>
References: <20180327110420.29414-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jyqu=gr=citrix.com=prvs=617bf0025=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0mUD-0002VJ-AR
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 11:09:53 +0000
Content-Disposition: inline
In-Reply-To: <20180327110420.29414-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMTI6MDQ6MjBQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBBdm9pZCB0aGUgbmVlZCB0byBkZWFsbG9jYXRlIG1lbW9yeSB3aGVuIHRoZSBkYXRhIGlzIGlu
dmFsaWQuIEl0IGhhcwo+IHRoZSBiZW5lZml0IHRvIG5vdCBmcmFnbWVudCBtZW1vcnkgaW4gWGVu
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+IC0tLQo+
IEZvdW5kIGJ5IGNvZGUgaW5zcGVjdGlvbi4gVGhlcmUgc2hvdWxkbid0IGJlIGFueSBwcmFjdGlj
YWwgZGlmZmVyZW5jZQo+IGluIG91ciBjdXJyZW50IHNldHVwIGJlY2F1c2UgdGhlIGZ1bmN0aW9u
IGlzIGhhcmR3YXJlIGRvbWFpbiBvbmx5Lgo+IEJ1dCBJU1RNIHRoZSBwbGFuIGlzIHRvIG1ha2Ug
dGhpcyBhdmFpbGFibGUgdG8gRG9tVSBpbiB0aGUgZnV0dXJlIHNvCj4gd2UnZCBiZXR0ZXIgYmUg
Y2FyZWZ1bCBhYm91dCBidWdneSAvIG1hbGljaW91cyBndWVzdHMuCgpUaGlzIGZ1bmN0aW9uIG11
c3QgYmUgY2FsbGVkIGJ5IHRoZSB0b29sc3RhY2ssIGd1ZXN0cyB3b24ndCBiZSBhbGxvd2VkCnRv
IHJlZ2lzdGVyIE1DRkcgcmVnaW9ucyB0aGVtc2VsdmVzIGFueXdheSwgc28gdGhlcmUgc2hvdWxk
IGJlIG5vCmd1ZXN0IHBhdGggdGhhdCBsZWFkcyBoZXJlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
