From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Prevent buffer overflow in privcmd
 ioctl
Date: Fri, 5 Apr 2019 08:47:40 +0200
Message-ID: <768d31bc-431f-d7d8-6fc3-8ded51764ffe@suse.com>
References: <20190404151217.GA22334@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AWOr=SH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hCIdi-0000Ns-Hr
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 06:47:50 +0000
In-Reply-To: <20190404151217.GA22334@kadam>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDQvMjAxOSAxNzoxMiwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBUaGUgImNhbGwiIHZh
cmlhYmxlIGNvbWVzIGZyb20gdGhlIHVzZXIgaW4gcHJpdmNtZF9pb2N0bF9oeXBlcmNhbGwoKS4K
PiBJdCdzIGFuIG9mZnNldCBpbnRvIHRoZSBoeXBlcmNhbGxfcGFnZVtdIHdoaWNoIGhhcyAoUEFH
RV9TSVpFIC8gMzIpCj4gZWxlbWVudHMuICBXZSBuZWVkIHRvIHB1dCBhbiB1cHBlciBib3VuZCBv
biBpdCB0byBwcmV2ZW50IGFuIG91dCBvZgo+IGJvdW5kcyBhY2Nlc3MuCj4gCj4gRml4ZXM6IDEy
NDZhZTBiYjk5MiAoInhlbjogYWRkIHZhcmlhYmxlIGh5cGVyY2FsbCBjYWxsZXIiKQo+IFNpZ25l
ZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KClB1c2hl
ZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNS4xYgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
