From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 2/4] xen/arm: use SYMBOL when required
Date: Mon, 7 Jan 2019 10:54:20 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901071041440.800@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901031114230.800@sstabellini-ThinkPad-X260>
 <1546543191-9206-2-git-send-email-sstabellini@kernel.org>
 <5C33256F020000780020ABEC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gga2Z-00079z-3J
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 18:54:23 +0000
In-Reply-To: <5C33256F020000780020ABEC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA3IEphbiAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDMuMDEuMTkg
YXQgMjA6MTksIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IFVzZSBTWU1CT0wg
aW4gY2FzZXMgb2YgY29tcGFyaXNvbnMgYW5kIHN1YnRyYWN0aW9ucyBvZjoKPiA+IAo+ID4gX3N0
YXJ0LCBfZW5kLCBfX2luaXRfYmVnaW4sIF9faW5pdF9lbmQsICBfXzJNX3RleHRfZW5kLAo+ID4g
X18yTV9yb2RhdGFfc3RhcnQsIF9fMk1fcm9kYXRhX2VuZCwgX18yTV9pbml0X3N0YXJ0LF9fMk1f
aW5pdF9lbmQsCj4gPiBfXzJNX3J3ZGF0YV9zdGFydCwgX18yTV9yd2RhdGFfZW5kLCBfc3RleHQs
IF9ldGV4dCwgX3Nyb2RhdGEsIF9lcm9kYXRhLAo+ID4gX19lbmRfdnBjaV9hcnJheSwgX19zdGFy
dF92cGNpX2FycmF5LCBfc2luaXR0ZXh0LCBfZWluaXR0ZXh0LAo+ID4gX3N0ZXh0ZW50cnksIF9l
dGV4dGVudHJ5LCBfX3N0YXJ0X2J1Z19mcmFtZXMsIF9fc3RvcF9idWdfZnJhbWVzXzAsCj4gPiBf
X3N0b3BfYnVnX2ZyYW1lc18xLCBfX3N0b3BfYnVnX2ZyYW1lc18yLF9fc3RvcF9idWdfZnJhbWVz
XzMsCj4gPiBfX25vdGVfZ251X2J1aWxkX2lkX3N0YXJ0LCBfX25vdGVfZ251X2J1aWxkX2lkX2Vu
ZCwgX19zdGFydF9fX2V4X3RhYmxlLAo+ID4gX19zdG9wX19fZXhfdGFibGUsIF9fc3RhcnRfX19w
cmVfZXhfdGFibGUsIF9fc3RvcF9fX3ByZV9leF90YWJsZSwKPiA+IF9fbG9ja19wcm9maWxlX3N0
YXJ0LCBfX2xvY2tfcHJvZmlsZV9lbmQsIF9fcGFyYW1fc3RhcnQsCj4gPiBfX3BhcmFtX2VuZCwg
X19zZXR1cF9zdGFydCwgX19zZXR1cF9lbmQsIF9faW5pdGNhbGxfc3RhcnQsCj4gPiBfX2luaXRj
YWxsX2VuZCwgX19wcmVzbXBfaW5pdGNhbGxfZW5kLCBfX3RyYW1wb2xpbmVfcmVsX3N0YXJ0LAo+
ID4gX190cmFtcG9saW5lX3JlbF9zdG9wLCBfX3RyYW1wb2xpbmVfc2VnX3N0YXJ0LCBfX3RyYW1w
b2xpbmVfc2VnX3N0b3AKPiA+IF9fYWx0X2luc3RydWN0aW9ucywgX19hbHRfaW5zdHJ1Y3Rpb25z
X2VuZCwgX19jdG9yc19zdGFydCwgX19jdG9yc19lbmQsCj4gPiBfX2VuZF9zY2hlZHVsZXJzX2Fy
cmF5LCBfX3N0YXJ0X3NjaGVkdWxlcnNfYXJyYXksIF9fYnNzX3N0YXJ0LAo+ID4gX19ic3NfZW5k
LCBfX3Blcl9jcHVfc3RhcnQsIF9fcGVyX2NwdV9kYXRhX2VuZCwgX3NwbGF0Zm9ybSwgX2VwbGF0
Zm9ybSwKPiA+IF9zZGV2aWNlLCBfZWRldmljZSwgX2FzZGV2aWNlLCBfYWVkZXZpY2UsIF9fcHJv
Y19pbmZvX3N0YXJ0LAo+ID4gX19wcm9jX2luZm9fZW5kLCBfc2R0Ygo+IAo+IERpZG4ndCB5b3Ug
Z28gYSBsaXR0bGUgdG9vIGZhciB3aXRoIGNvcHktYW5kLXBhc3RlIGhlcmU/IEkgZG9uJ3QgdGhp
bmsKPiBhbGwgb2YgdGhlIHN5bWJvbHMgcmVhbGx5IGV4aXN0IGluIEFybSAoYW5kIHNpbWlsYXJs
eSBpbiB0aGUgeDg2IGluc3RhbmNlCj4gSSB0aGluayB0aGVyZSBhcmUgc29tZSBBcm0tb25seSBz
eW1ib2xzKS4KCk9wcywgeW91IGFyZSByaWdodCwgSSdsbCBmaWx0ZXIgdGhlIGxpc3QgaW4gZWFj
aCBjb21taXQgbWVzc2FnZSB0byBvbmx5CnRoZSBzeW1ib2xzIHRoYXQgbWFrZSBzZW5zZS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
