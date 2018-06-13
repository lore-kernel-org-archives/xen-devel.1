From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: don't use privcmd_call() from
 xen_mc_flush()
Date: Wed, 13 Jun 2018 04:20:17 -0600
Message-ID: <5B20EFE102000078001CACD4__9406.42670398137$1528885135$gmane$org@prv1-mh.provo.novell.com>
References: <20180613095806.2978-1-jgross@suse.com>
 <5B20EC6C02000078001CACBA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bhoq=i7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fT2t2-0003Kx-4T
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 10:20:20 +0000
In-Reply-To: <5B20EC6C02000078001CACBA@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA2LjE4IGF0IDEyOjA1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDEzLjA2LjE4IGF0IDExOjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gVXNpbmcg
cHJpdmNtZF9jYWxsKCkgZm9yIGEgc2luZ2xldG9uIG11bHRpY2FsbCBzZWVtcyB0byBiZSB3cm9u
ZywgYXMKPj4gcHJpdmNtZF9jYWxsKCkgaXMgdXNpbmcgc3RhYygpL2NsYWMoKSB0byBlbmFibGUg
aHlwZXJ2aXNvciBhY2Nlc3MgdG8KPj4gTGludXggdXNlciBzcGFjZS4KPj4gCj4+IEFkZCBhIG5l
dyB4ZW5fc2luZ2xlX2NhbGwoKSBmdW5jdGlvbiB0byBiZSB1c2UgZm9yIHRoYXQgcHVycG9zZS4K
Pj4gCj4+IFJlcG9ydGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWN0dWFsbHkgSSd2ZSBvbmx5
IG5vdyByZWFsaXplZCB0aGF0IHRoaXMgaXNuJ3QgYSByZWFsIHByb2JsZW0gcmlnaHQgbm93OgpQ
ViBjYW4ndCB1c2UgU01BUCAod2UgZG9uJ3QgcHJvdmlkZSBhIHZpcnR1YWxpemVkIHZlcnNpb24g
b2YgaXQpLCBhbmQKSFZNL1BWSCBjYW4ndCB1c2UgbXVsdGljYWxscyAod2hpY2ggbWF5IGhhdmUg
dG8gY2hhbmdlIGZvciBQVkggRG9tMCwKc28gaGF2aW5nIHRoZSBjaGFuZ2UgaW4gcGxhY2UgaXMg
aGVscGZ1bCBhbnl3YXkpLCBzbyB0aGUgd2hvbGUKaW4ta2VybmVsIGxvZ2ljIHRvIGNvbGxlY3Qg
YW5kIGlzc3VlIGJhdGNoZXMgc2hvdWxkIGJlIHVucmVhY2hhYmxlIHRoZXJlLgoKQnV0IHBlcmhh
cHMgdGhlIGNvbW1pdCBtZXNzYWdlIHdvdWxkIGJlbmVmaXQgZnJvbSBhIGxpdHRsZSBiaXQgb2YK
cmUtd29yZGluZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
