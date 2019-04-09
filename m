From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: posted interrupts require interrupt
 remapping
Date: Tue, 9 Apr 2019 10:10:24 +0100
Message-ID: <1bba74a5-5be0-67c8-930a-2f07db4580f2@citrix.com>
References: <5CA6FD5D0200007800224C46@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rl/Z=SL=citrix.com=prvs=995435944=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hDmmL-0003fv-AA
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:10:53 +0000
In-Reply-To: <5CA6FD5D0200007800224C46@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDQvMjAxOSAwODowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW5pdGlhbGx5IEkgaGFk
IGp1c3Qgbm90aWNlZCB0aGUgdW5uZWNlc3NhcnkgaW5kaXJlY3Rpb24gaW4gdGhlIGNhbGwKPiBm
cm9tIHBpX3VwZGF0ZV9pcnRlKCkuIFRoZSBnZW5lcmljIHdyYXBwZXIgaGF2aW5nIGFuIGlvbW11
X2ludHJlbWFwCj4gY29uZGl0aW9uYWwgbWFkZSBtZSBsb29rIGF0IHRoZSBzZXR1cCBjb2RlIHRo
b3VnaC4gU28gZmlyc3Qgb2YgYWxsCj4gZW5mb3JjZSB0aGUgbmVjZXNzYXJ5IGRlcGVuZGVuY3ku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZp
ZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
