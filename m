From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libs/foreignmemory: Avoid printing an error
 for ENOTSUPP
Date: Tue, 14 Aug 2018 08:59:38 +0100
Message-ID: <20180814075938.g6qr3454wb66qoi5@citrix.com>
References: <20180813173325.14697-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m/c6=k5=citrix.com=prvs=7578e698a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fpUEw-0003nk-UZ
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 07:59:42 +0000
Content-Disposition: inline
In-Reply-To: <20180813173325.14697-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMTMsIDIwMTggYXQgMDY6MzM6MjVQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IFJlc291cmNlIG1hcHBpbmcgaXMgbm90IHN1cHBvcnRlZCBvbiBBcm0gYW5kIHJlc3Vs
dHMgdG8gYW4gZXJyb3IgbWVzc2FnZQo+IGF0IGV2ZXJ5IGd1ZXN0IGJvb3Q6Cj4gCj4geGVuZm9y
ZWlnbm1lbW9yeTogZXJyb3I6IGlvY3RsIGZhaWxlZDogT3BlcmF0aW9uIG5vdCBzdXBwb3J0ZWQK
PiAKPiBIaWRlIHRoZSBlcnJvciBtZXNzYWdlIHdoZW4gZXJybm9yIGlzIEVOT1RTVVBQLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
