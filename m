From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] kprobes/x86/xen: blacklist non-attachable
 xen interrupt functions
Date: Mon, 17 Dec 2018 10:57:25 -0500
Message-ID: <88c20ba0-2528-e309-34d5-01fb16d2e5ac__46360.3474236608$1545062200$gmane$org@oracle.com>
References: <20181210151256.GA1977@Dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h5pW=O2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gYvHM-00028c-Al
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 15:58:00 +0000
In-Reply-To: <20181210151256.GA1977@Dell>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrea Righi <righi.andrea@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggMTA6MTIgQU0sIEFuZHJlYSBSaWdoaSB3cm90ZToKPiBCbGFja2xpc3Qgc3lt
Ym9scyBpbiBYZW4gcHJvYmUtcHJvaGliaXRlZCBhcmVhcywgc28gdGhhdCB1c2VyIGNhbiBzZWUK
PiB0aGVzZSBwcm9oaWJpdGVkIHN5bWJvbHMgaW4gZGVidWdmcy4KPgo+IFNlZSBhbHNvOiBhNTA0
ODBjYjZkNjEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWEgUmlnaGkgPHJpZ2hpLmFuZHJlYUBn
bWFpbC5jb20+CgpBcHBsaWVkIHRvIGZvci1saW51cy00LjIxCgotYm9yaXMKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
