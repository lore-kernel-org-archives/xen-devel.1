From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: xenbus: use put_device() instead of
	kfree()
Date: Thu, 8 Mar 2018 15:31:39 +0100
Message-ID: <bd2e633a-b0cc-c79a-2563-aa541a224184__17430.2817126319$1520519448$gmane$org@suse.com>
References: <46ec1b05b5643fd6c52ada8c6d8e4a9f1c3f1da8.1520330916.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=4t3w=f6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1etwaC-0004k5-Ly
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 14:31:48 +0000
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
PGFydmluZC55YWRhdi5jc0BnbWFpbC5jb20+CgpDb21taXR0ZWQgdG8geGVuL3RpcC5naXQgZm9y
LWxpbnVzLTQuMTZhCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
