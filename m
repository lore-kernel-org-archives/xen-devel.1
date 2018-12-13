From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Thu, 13 Dec 2018 14:13:21 +0100
Message-ID: <64b4fc44-d3f5-ed4e-ee4c-38e78313d979__37339.8960255601$1544706742$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
 <faae2cec-1ff2-74eb-69c8-b75f64cfca3a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C63b=OW=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gXQo0-0003e9-1O
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 13:13:32 +0000
In-Reply-To: <faae2cec-1ff2-74eb-69c8-b75f64cfca3a@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, mchehab@kernel.org, jpoimboe@redhat.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, dave.hansen@linux.intel.com, hch@infradead.org, mingo@redhat.com, tglx@linutronix.de, rdunlap@infradead.org, luto@kernel.org, hpa@zytor.com, boris.ostrovsky@oracle.com, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTIvMTggMTk6MDksIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBPbiAxMi82LzIwMTggMToy
MSBQTSwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4gT24gMDYvMTIvMTggMDc6MDIsIE1hcmFuIFdp
bHNvbiB3cm90ZToKPj4+IEZvciBjZXJ0YWluIGFwcGxpY2F0aW9ucyBpdCBpcyBkZXNpcmFibGUg
dG8gcmFwaWRseSBib290IGEgS1ZNIHZpcnR1YWwKPj4+IG1hY2hpbmUuIEluIGNhc2VzIHdoZXJl
IGxlZ2FjeSBoYXJkd2FyZSBhbmQgc29mdHdhcmUgc3VwcG9ydCB3aXRoaW4gdGhlCj4+PiBndWVz
dCBpcyBub3QgbmVlZGVkLCBRZW11IHNob3VsZCBiZSBhYmxlIHRvIGJvb3QgZGlyZWN0bHkgaW50
byB0aGUKPj4+IHVuY29tcHJlc3NlZCBMaW51eCBrZXJuZWwgYmluYXJ5IHdpdGhvdXQgdGhlIG5l
ZWQgdG8gcnVuIGZpcm13YXJlLgo+Pj4KPj4+IFRoZXJlIGFscmVhZHkgZXhpc3RzIGFuIEFCSSB0
byBhbGxvdyB0aGlzIGZvciBYZW4gUFZIIGd1ZXN0cyBhbmQgdGhlIEFCSQo+Pj4gaXMgc3VwcG9y
dGVkIGJ5IExpbnV4IGFuZCBGcmVlQlNEOgo+Pj4KPj4+IMKgwqDCoCBodHRwczovL3hlbmJpdHMu
eGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MvcHZoLmh0bWwKPj4+Cj4+PiBUaGlzIHBhdGNoIHNl
cmllcyB3b3VsZCBlbmFibGUgUWVtdSB0byB1c2UgdGhhdCBzYW1lIGVudHJ5IHBvaW50IGZvcgo+
Pj4gYm9vdGluZyBLVk0gZ3Vlc3RzLgo+PiBUaGFua3MhwqAgSSBzaG91bGQgYmUgYWJsZSB0byBw
b3N0IGEgVGVzdGVkLWJ5IG5leHQgTW9uZGF5LsKgIEJvcmlzLCBhcmUKPj4geW91IGdvaW5nIHRv
IHBpY2sgaXQgdXAgZm9yIDQuMjE/Cj4gCj4gSGkgUGFvbG8sCj4gCj4gQXJlIHlvdSBzdGlsbCBw
bGFubmluZyBvbiBydW5uaW5nIHNvbWUgdGVzdGluZyBvZiB5b3VyIG93biBmb3IgdGhlc2UKPiBw
YXRjaGVzPyBTaG91bGQgQm9yaXMgd2FpdCB0byBoZWFyIGZyb20geW91IGJlZm9yZSBtb3Zpbmcg
Zm9yd2FyZD8KCkhlIGNhbiBnbyBhaGVhZCB3aXRoIHY5LCBJIHdhcyBqdXN0IGN1cmlvdXMgYWJv
dXQgaXQuCgpQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
