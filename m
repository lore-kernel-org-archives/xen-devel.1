From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] iommu: Eliminate an odd local variable
Date: Tue, 22 Jan 2019 01:20:41 -0700
Message-ID: <5C46D259020000780020FFDB@prv1-mh.provo.novell.com>
References: <1548086648-8102-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3rQ9=P6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1glrIc-0007cg-LR
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 08:20:46 +0000
In-Reply-To: <1548086648-8102-1-git-send-email-andrii.anisov@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrii.anisov@gmail.com
Cc: xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAxLjE5IGF0IDE3OjA0LCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IFdpcGUgb3V0IGV4Y2Vzc2l2ZSBsaW5lcyBmcm9tIGFuIGlvbW11X3VubWFwKCksIGFuZCBh
bGlnbiBpdCB3aXRoIGFuCj4gaW9tbXVfbWFwKCkgY29kZS4KCldoYXQncyBleGNlc3NpdmUgdGhl
cmU/IEhvdyBjb21lIHlvdSBhbHRlciB0aGUgZnVuY3Rpb24ncwpyZXR1cm4gdmFsdWUgd2l0aG91
dCBzYXlpbmcgd2h5PyBUaGUgbW9yZSB0aGF0IHlvdSBtYWtlCml0IHBvdGVudGlhbGx5IHJldHVy
biBzdWNjZXNzIHdoZW4gdGhlcmUgd2FzIGFuIGVycm9yLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
