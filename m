From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: remove global bit from
 __default_kernel_pte_mask for pv guests
Date: Tue, 10 Jul 2018 18:27:30 -0400
Message-ID: <204ae9dc-e949-1db9-5dd8-8649079e0ae0__24227.2046082237$1531261556$gmane$org@oracle.com>
References: <20180702100018.26279-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpav=j2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fd16G-0003eJ-UQ
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 22:27:13 +0000
In-Reply-To: <20180702100018.26279-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, stable@vger.kernel.org, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDIvMjAxOCAwNjowMCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaGVuIHJlbW92
aW5nIHRoZSBnbG9iYWwgYml0IGZyb20gX19zdXBwb3J0ZWRfcHRlX21hc2sgZG8gdGhlIHNhbWUg
Zm9yCj4gX19kZWZhdWx0X2tlcm5lbF9wdGVfbWFzayBpbiBvcmRlciB0byBhdm9pZCB0aGUgV0FS
Tl9PTkNFKCkgaW4KPiBjaGVja19wZ3Byb3QoKSB3aGVuIHNldHRpbmcgYSBrZXJuZWwgcHRlIGJl
Zm9yZSBoYXZpbmcgY2FsbGVkCj4gaW5pdF9tZW1fbWFwcGluZygpLgo+Cj4gQ2M6IDxzdGFibGVA
dmdlci5rZXJuZWwub3JnPiAjIDQuMTcKPiBSZXBvcnRlZC1ieTogTWljaGFlbCBZb3VuZyA8bS5h
LnlvdW5nQGR1cmhhbS5hYy51az4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
