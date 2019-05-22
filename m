From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
Date: Wed, 22 May 2019 11:00:02 +0100
Message-ID: <34f128f9-190d-fdf7-0082-204ab9ccb31a@citrix.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bu0R=TW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTO2a-0008S7-Ab
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:00:08 +0000
In-Reply-To: <20190522094549.28397-3-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMjAxOSAxMDo0NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBwcmVlbXB0X2NvdW50
KCkgYW5kIHRoZSBhc3NvY2lhdGVkIHBlci1jcHUgdmFyaWFibGUgX19wcmVlbXB0X2NvdW50Cj4g
YXJlIHRlc3RlZCBpbiBkZWJ1ZyBidWlsZCBvbmx5LiBTbyBkcm9wIHRoZW0gZm9yIG5vbi1kZWJ1
ZyBidWlsZHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgpJJ2QgYmUgdGVtcHRlZCB0byBmb2xkIHBhdGNoZXMgMiBhbmQgMyB0b2dldGhlciwgYmVj
YXVzZSB0aGV5IGFyZSBib3RoCnRoZSBzYW1lIGNoYW5nZSwgYW5kIGl0IHdvdWxkIHJlZHVjZSB0
aGUgY2h1cm4uCgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4sIGlkZWFsbHkgd2l0aCB0aGUKdHdvIGZvbGRlZCBpbnRvIG9uZS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
