From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [faster-by-no-jump-table] retpoline: disable jump
 tables
Date: Tue, 20 Nov 2018 08:44:31 -0700
Message-ID: <5BF42BDF02000078001FE1DF@prv1-mh.provo.novell.com>
References: <1542728274-29599-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zydc=n7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gP8Cb-0003sd-2Y
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 15:44:37 +0000
In-Reply-To: <1542728274-29599-1-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Hongjiu Lu <hongjiu.lu@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, David Woodhouse <dwmw2@infradead.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE2OjM3LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBU
byBtaXRpZ2F0ZSBNZWx0ZG93biwgWGVuIGhhcyBiZWVuIGZpeGVkIHdpdGggYSBzb2Z0d2FyZSBm
aXgsIG5hbWVseQo+IHVzaW5nIHJldHBvbGluZSBzZXF1ZW5jZXMgZ2VuZXJhdGVkIGJ5IHRoZSBj
b21waWxlci4gVGhpcyB3YXksIGluZGlyZWN0Cj4gYnJhbmNoZXMgYXJlIHByb3RlY3RlZCBhZ2Fp
bnN0IHRoZSBhdHRhY2suCj4gCj4gSG93ZXZlciwgdGhlIHJldHBvbGluZSBzZXF1ZW5jZSBjb21l
cyB3aXRoIGEgc2xvdyBkb3duLiBUbyBtYWtlIHVwIGZvcgo+IHRoaXMsIHdlIHByb3Bvc2UgdG8g
YXZvaWQganVtcCB0YWJsZXMgaW4gdGhlIGZpcnN0IHBsYWNlLiBXaXRob3V0IHRoZQo+IHJldHBv
bGluZSBzZXF1ZW5jZXMsIHRoaXMgY29kZSB3b3VsZCBiZSBsZXNzIGVmZmljaWVudC4gSG93ZXZl
ciwgd2hlbgo+IHJldHBvbGluZSBpcyBlbmFibGVkLCB0aGlzIGFjdHVhbGx5IHJlc3VsdHMgaW4g
YSBzbGlnaHQgcGVyZm9ybWFuY2UKPiBpbXByb3ZlbWVudC4KPiAKPiBUaGlzIGNoYW5nZSBtaWdo
dCBiZWNvbWUgaXJyZWxldmFudCBvbmNlIHRoZSBjb21waWxlciBzdGFydHMgYXZvaWRpbmcKPiBq
dW1wIHRhYmxlcyBpbiBjYXNlIHJldHBvbGluZXMgYXJlIHVzZWQ6Cj4gaHR0cHM6Ly9nY2MuZ251
Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9ODY5NTIgCj4gCj4gUmVwb3J0ZWQtYnk6IEp1
bGlhbiBTdGVja2xpbmEgPGpzdGVja2xpQGFtYXpvbi5kZT4KPiBSZXBvcnRlZC1ieTogUGF3ZWwg
V2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmJl
cnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkluIHRoZSBmdXR1cmUgcGxlYXNlIHBsYXkgYnkgcGF0Y2ggc3Vi
bWlzc2lvbiBydWxlczogUGF0Y2hlcyBnZXQKc2VudCBfdG9fIHRoZSBsaXN0LCB3aXRoIG1haW50
YWluZXJzIChhbmQgd2hvZXZlciBlbHNlKSBvbiBfY2NfLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
