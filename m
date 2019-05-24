From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] vsprintf: constify "end" parameters
Date: Fri, 24 May 2019 13:44:50 +0100
Message-ID: <9fdb4627-7606-138f-e0fd-9528670b6704@citrix.com>
References: <5CE7E5830200007800232051@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hU9ZA-0004DP-KK
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 12:44:56 +0000
In-Reply-To: <5CE7E5830200007800232051@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMjAxOSAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRXhjZXB0IGluIHRoZSB0
b3AgbGV2ZWwgZnVuY3Rpb24gd2UgZG9uJ3QgbWVhbiB0byBldmVyIHdyaXRlIHRocm91Z2gKPiAi
ZW5kIi4gVGhlIHZhcmlhYmxlIGlzIHVzZWQgc29sZWx5IGZvciBwb2ludGVyIGNvbXBhcmlzb24g
cHVycG9zZXMKPiB0aGVyZS4gQWRkIGNvbnN0IGV2ZXJ5d2hlcmUuCj4KPiBBbHNvIG1ha2UgZnVu
Y3Rpb24gaGVhZGluZyB3cmFwcGluZyBzdHlsZSB1bmlmb3JtIGFnYWluIGZvciBhbGwgb2YgdGhl
Cj4gaW52b2x2ZWQgZnVuY3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
