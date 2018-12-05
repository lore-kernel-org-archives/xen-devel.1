From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/2] remaining XSA-276 follow-up
Date: Wed, 05 Dec 2018 09:14:18 -0700
Message-ID: <5C07F95A0200007800203354@prv1-mh.provo.novell.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUZof-0004AU-Al
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 16:14:25 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

QSBmZXcgdGhpbmdzIEkgaGFkIHJ1biBpbnRvIHdoaWxlIHdvcmtpbmcgb24gdGhhdCBpc3N1ZToK
CjE6IHg4NjogcmVkdWNlIGNvZGUgZHVwbGljYXRpb24gaW4gZ3Vlc3RfcmVtb3ZlX3BhZ2UoKQoy
OiBtYWtlIGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKCkgX19tdXN0X2NoZWNrCgpUaGV5IGRvbid0
IGRlcGVuZCBvbiBvbmUgYW5vdGhlciwgdGhleSdyZSBncm91cGVkIHRvZ2V0aGVyCmp1c3QgYmVj
YXVzZSBvZiB0aGVpciBvcmlnaW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
