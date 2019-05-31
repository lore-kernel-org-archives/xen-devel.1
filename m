From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: make keyhanler configurable
Date: Fri, 31 May 2019 15:30:02 -0700
Message-ID: <a42a8cc4-f5dc-f6f4-d17b-a8b7f673c7f5@citrix.com>
References: <1559267880-27863-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWq2P-0006by-JE
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 22:30:13 +0000
In-Reply-To: <1559267880-27863-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMjAxOSAxODo1OCwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+IGtleWhhbmRsZXIgbWFp
bmx5IHVzZWQgZm9yIGRlYnVnIHVzYWdlIGJ5IGRldmVsb3BlcnMgd2hpY2ggY2FuIGR1bXAKPiB4
ZW4gbW9kdWxlKGVnLiB0aW1lciwgc2NoZWR1bGVyKSBzdGF0dXMgYXQgcnVudGltZSBieSBpbnB1
dAo+IGNoYXJhY3RlciBmcm9tIGNvbnNvbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENo
ZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+CgpXaGF0IGlzIHRoZSBtb3RpdmF0aW9uIGhlcmU/
wqAgSSBkb24ndCBoYXZlIGEgc3BlY2lmaWMgb2JqZWN0aW9uIHRvCm1ha2luZyB0aGlzIGNvbmZp
Z3VyYWJsZSAoc28gbG9uZyBhcyBpdCBleGNpc2VzIHRoZSBlbnRpcmUga2V5aGFuZGxlcgppbmZy
YXN0cnVjdHVyZSwgd2hpY2ggaXMgcmF0aGVyIG1vcmUgdGhhbiB0aGlzIHBhdGNoIGRvZXMpLCBi
dXQgSSBhbHNvCmRvbid0IHNlZSB3aHkgd2Ugd291bGQgd2FudCB0byBkbyBzbyBpbiB0aGUgZmly
c3QgcGxhY2UuCgpJbiBwYXJ0aWN1bGFyLCBpdCBkb2Vzbid0IHJlcXVpcmUgYSBzZXJpYWwgY29u
c29sZSB0byBmdW5jdGlvbiBjb3JyZWN0bHkKaW4gdGhlIGZpcnN0IHBsYWNlLsKgIFRoaXMgZnVu
Y3Rpb25hbGl0eSBjYW4gYmUgdXNlZCB3aXRoIGB4bCBkZWJ1Zy1rZXlzCiRjaGFyOyB4bCBkbWVz
Z2AKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
