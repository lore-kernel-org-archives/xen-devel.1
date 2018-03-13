From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Tue, 13 Mar 2018 02:07:00 -0600
Message-ID: <5AA794B402000078001B0CC7@prv-mh.provo.novell.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5AA2B67302000078001B0567@suse.com>
 <4fb72f31-683d-1de3-db90-4788a379b0bd@suse.com>
 <5AA679BD0200007800129C56@prv-mh.provo.novell.com>
 <4c0abb8c-7c16-6a89-29c1-d20e4c16e4c2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evexe-0003Fq-VA
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 08:07:06 +0000
In-Reply-To: <4c0abb8c-7c16-6a89-29c1-d20e4c16e4c2@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAzLjE4IGF0IDE0OjEwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBCVFc6
IGFyZSB5b3UgYWxyZWFkeSB3b3JraW5nIG9uIHJlYmFzaW5nIHlvdXIgWFBUSSBzcGVlZCB1cCBz
ZXJpZXMgdG8KPiBjdXJyZW50IHN0YWdpbmc/IEknZCBsaWtlIG15IHNlcmllcyB0byB1c2UgeW91
ciBzZXJpZXMgYXMgYSBiYXNlIHVubGVzcwo+IHlvdSBhcmUgdGVsbGluZyBtZSB5b3Ugd29uJ3Qg
YmUgYWJsZSB0byByZXNlbmQgeW91ciBzZXJpZXMgc29vbi4KCkNvbWluZyBiYWNrIHRvIG15IHJl
cGx5IGhlcmUgeWVzdGVyZGF5IC0gdGhlbiBhZ2FpbiBJJ20gYSBsaXR0bGUKcmVsdWN0YW50IHRv
IHNlbmQgb3V0IGEgbmV3IHZlcnNpb24gdGhhdCBoYXMgbm8gY2hhbmdlcyBvdGhlcgp0aGFuIGJl
aW5nIHJlLWJhc2VkLCB3aGVuIHRoZXJlIHdlcmUgbm8gY29tbWVudHMgYnkgQW5kcmV3Cm9uIG1v
c3Qgb2YgdGhlIHJlbWFpbmluZyBwYXRjaGVzIHlldCAoYW5kIGluIHRoZSBvbmUgY2FzZQp3aGVy
ZSB0aGVyZSB3ZXJlIGNvbW1lbnRzLCBJJ20gYWZyYWlkIEkgY29udGludWUgdG8gZGlzYWdyZWUs
CmJ1dCBJJ2xsIHNlZSBhYm91dCBtb3ZpbmcgdGhhdCBwYXRjaCBsYXN0IGluIHRoZSBzZXJpZXMp
LgoKUGx1cyBzdGFnaW5nIGlzIGJyb2tlbiByaWdodCBub3cgYW55d2F5IChidXQgb2YgY291cnNl
IHdlIGtub3cKbm93IHdoaWNoIHBhdGNoIHRvIHJldmVydCBpZiBuZWVkIGJlKS4KCkphbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
