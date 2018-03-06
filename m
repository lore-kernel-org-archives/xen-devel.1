From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: xenbus: use put_device() instead of
	kfree()
Date: Tue, 6 Mar 2018 12:01:10 +0100
Message-ID: <46755d70-c7b2-f107-7aae-b12d232ce6cd__24826.5977287248$1520334002$gmane$org@suse.com>
References: <46ec1b05b5643fd6c52ada8c6d8e4a9f1c3f1da8.1520330916.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xqmt=f4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1etALK-0004ZV-CY
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 11:01:14 +0000
In-Reply-To: <46ec1b05b5643fd6c52ada8c6d8e4a9f1c3f1da8.1520330916.git.arvind.yadav.cs@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDMvMTggMTE6MTAsIEFydmluZCBZYWRhdiB3cm90ZToKPiBOZXZlciBkaXJlY3RseSBm
cmVlIEBkZXYgYWZ0ZXIgY2FsbGluZyBkZXZpY2VfcmVnaXN0ZXIoKSwgZXZlbgo+IGlmIGl0IHJl
dHVybmVkIGFuIGVycm9yISBBbHdheXMgdXNlIHB1dF9kZXZpY2UoKSB0byBnaXZlIHVwIHRoZQo+
IHJlZmVyZW5jZSBpbml0aWFsaXplZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnZpbmQgWWFkYXYg
PGFydmluZC55YWRhdi5jc0BnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
