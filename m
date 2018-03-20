From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: Delay get_cpu_cap until stack
 canary is established
Date: Tue, 20 Mar 2018 07:28:08 +0100
Message-ID: <6d73d847-9f33-7dce-2f60-33481bb4776e__43528.0924117707$1521527241$gmane$org@suse.com>
References: <20180319165804.10636-1-jandryuk@gmail.com>
 <0726a193-6ce9-e835-9eef-01c56680d30a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vyyo=gk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eyAks-0000VE-FM
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 06:28:18 +0000
In-Reply-To: <0726a193-6ce9-e835-9eef-01c56680d30a@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDMvMTggMjM6MjIsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwMy8xOS8yMDE4
IDEyOjU4IFBNLCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+PiBDb21taXQgMmNjNDJiYWMxYzc5ICgi
eDg2LTY0L1hlbjogZWxpbWluYXRlIFcrWCBtYXBwaW5ncyIpIGludHJvZHVjZWQgYQo+PiBjYWxs
IHRvIGdldF9jcHVfY2FwLCB3aGljaCBpcyBmc3RhY2stcHJvdGVjdGVkLiAgVGhpcyBpcyB3b3Jr
cyBvbiB4ODYtNjQKPiAKPiBzL1RoaXMgaXMgd29ya3MvVGhpcyB3b3Jrcy8KPiAKPiBSZXZpZXdl
ZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiAKPiBE
byB3ZSBzdGlsbCBuZWVkIDRmMjc3Mjk1ZTU0PwoKSSdkIHJhdGhlciBrZWVwIGl0IGluIG9yZGVy
IHRvIGF2b2lkIG5hc3R5IHByb2JsZW1zIGluIGNhc2Ugc29tZXRoaW5nCmNoYW5nZXMuIEFmdGVy
IGFsbCB3ZSBhcmUgdHJ5aW5nIHRvIGRvIGFuIGluaXRpYWxpemF0aW9uIGluIEMgY29kZQp3aGlj
aCBzaG91bGQgYmUgZG9uZSBpbiBhc3NlbWJseSBiZWZvcmUgZW50ZXJpbmcgdGhlIEMgcGFydC4g
RG9pbmcgdGhpcwpwcm9wZXJseSBmb3IgMzItYml0IHB2LWtlcm5lbHMgd291bGQgYmUgcmF0aGVy
IGRpZmZpY3VsdCwgYnV0IHRoaXMgaXMgbm8KcmVhc29uIHRvIGRyb3AgdGhlIGNvcnJlY3Qgc29s
dXRpb24gZm9yIHRoZSA2NC1iaXQgY2FzZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
