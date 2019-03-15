From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH RFC 0/3] x86emul: further work
Date: Fri, 15 Mar 2019 05:51:16 -0600
Message-ID: <5C8B91B4020000780021F3AA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4lMv-0006Tx-PJ
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 11:51:21 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gdG9wIG9mIHRoZSBBVlg1MTIgc2VyaWVzIEknZCBsaWtlIHRvIHB1dCBvdXQgZm9yIGRpc2N1
c3Npb24KCjE6IGdlbmVyYWxpemUgd2JpbnZkKCkgaG9vawoyOiBzdXBwb3J0IFdCTk9JTlZECjM6
IHN1cHBvcnQgTU9WRElSe0ksNjRCfSBpbnNucwoKQ2xlYXJseSwgaWYgdGhlIGNvbmNlcHQgb2Yg
dGhlIGZpcnN0IHR3byBwYXRjaGVzIGlzIGFjY2VwdGFibGUsIEknZAp0aGVuIGRvIHRoZSBzYW1l
IGZvciBJTlZMUEcsIG1ha2luZyBpdCBhIG1vcmUgZ2VuZXJpYyBUTEIKbWFuYWdlbWVudCBob29r
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
