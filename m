From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v10 1/6] xen: introduce ptrdiff_t
Date: Tue, 26 Feb 2019 16:24:25 +0000
Message-ID: <23669.26681.915235.572323@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ku3n=RB=citrix.com=prvs=95365f554=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gyfXR-0007yU-GH
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 16:25:01 +0000
In-Reply-To: <1551127822-25886-1-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "JBeulich@suse.com" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIltQQVRDSCB2MTAgMS82XSB4ZW46IGludHJvZHVj
ZSBwdHJkaWZmX3QiKToKPiBJbnRyb2R1Y2UgdGhlIG5ldyB0eXBlICJwdHJkaWZmX3QiIHdoaWNo
IGlzIGRlZmluZWQgYXMgdGhlIHNpZ25lZAo+IGludGVnZXIgdHlwZSBvZiB0aGUgcmVzdWx0IG9m
IHN1YnRyYWN0aW5nIHR3byBwb2ludGVycy4gVXNlCj4gX19QVFJESUZGX1RZUEVfXyB0byBkZWZp
bmUgaXQuCj4gCj4gQWxzbywgdXNlIF9fVUlOVFBUUl9UWVBFX18gZm9yIHVpbnRwdHJfdCBmb3Ig
Y29uc2lzdGVuY3kuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVm
YW5vc0B4aWxpbnguY29tPgoKUmV2aWV3ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
