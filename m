From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 10/16] x86: don't setup legacy syscall
 vector when !CONFIG_PV
Date: Fri, 19 Oct 2018 17:09:43 +0100
Message-ID: <0818388d-cdf7-2581-cc2a-bbb15f5cee17@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <88a2440e85ce60162b6d7284530be7a2ab8ccbbc.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDXLP-0007Tm-4t
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 16:09:47 +0000
In-Reply-To: <88a2440e85ce60162b6d7284530be7a2ab8ccbbc.1539959287.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gUHV0IHRoZSBjb2RlIGluIHNtcGJv
b3QuYyB1bmRlciBDT05GSUdfUFYuIE5vdCB0aGF0IHdlIGRvbid0IG5lZWQgdG8KPiBzZXQgdXAg
YSBzdHViIGhlcmUgYmVjYXVzZSBlbnRyeS5TIGFscmVhZHkgZG9lcyB0aGF0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBzdHViIGlzbid0IHRo
ZSBwdXJwb3NlIG9mIHRoZSBjb2RlLsKgIFRoaXMgY29kZSBpcyB0byBzd2l0Y2ggYmV0d2VlbgpT
WVNfREVTQ190cmFwX2dhdGUgYW5kIFNZU19ERVNDX2lycV9nYXRlIGRlcGVuZGluZyBvbiB3aGV0
aGVyIHdlJ3JlCmludGVuZGluZyB0byB1c2UgWFBUSS7CoCBBbGwgb3RoZXIgZGV0YWlscyBpbiB0
aGUgSURUIGVudHJ5IGFyZSBhbHJlYWR5CmNvbmZpZ3VyZWQgY29ycmVjdGx5IGZvciBpbnQ4MF9k
aXJlY3RfdHJhcC4KClRoZSBwYXRjaCBpcyBmaW5lLCBidXQgd2l0aCBhbiB0d2Vha2VkIGNvbW1p
dCBtZXNzYWdlLCBSZXZpZXdlZC1ieToKQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
