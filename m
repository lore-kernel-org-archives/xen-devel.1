From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Fri, 7 Dec 2018 00:30:44 +0100
Message-ID: <cef985c3-a687-c1af-83ac-2c71af45a366__5538.7205248282$1544138982$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <3b4fdddd-67d8-30d3-2a5d-c4d07b6f31c9@oracle.com>
 <e76da394-c721-87ae-c721-1f6efdc93a50@redhat.com>
 <becd5f82-0cca-f74b-93bd-6b4f13bc8bf0@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NSIP=OP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gV36a-0005x4-MQ
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 23:30:52 +0000
In-Reply-To: <becd5f82-0cca-f74b-93bd-6b4f13bc8bf0@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTggMDA6MTEsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMi82LzE4IDU6
NDkgUE0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4+IE9uIDA2LzEyLzE4IDIzOjM0LCBCb3JpcyBP
c3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAxMi82LzE4IDU6MTEgUE0sIFBhb2xvIEJvbnppbmkgd3Jv
dGU6Cj4+Pgo+Pj4+IGFuZCBhbHNvCj4+Pj4KPj4+PiAJZGVwZW5kcyBvbiAhRUZJCj4+Pj4KPj4+
PiBiZWNhdXNlIGV2ZW4gdGhvdWdoIGluIHByaW5jaXBsZSBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byB3cml0ZSBhIFBWSAo+Pj4+IGxvYWRlciBmb3IgVUVGSSwgUFZIJ3Mgc3RhcnQgaW5mbyBkb2Vz
IG5vdCBzdXBwb3J0IHRoZSBFRkkgaGFuZG92ZXIKPj4+PiBwcm90b2NvbC4KPj4+IEJ1dCB3ZSBz
aG91bGQgYmUgYWJsZSB0byBidWlsZCB0aGUgYmluYXJ5IHdpdGggYm90aCBFRkkgYW5kIFBWSD8K
Pj4gQ2FuIHlvdT8gIEl0J3MgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBiaW5hcnkgZm9ybWF0LCB0
aGUgRUZJIGhhbmRvdmVyCj4+IHByb3RvY29sIGlzIGludm9rZWQgdmlhIGEgc3BlY2lhbCBlbnRy
eSBwb2ludCBhbmQgbmVlZHMgdGhlIExpbnV4IGhlYWRlcgo+PiBmb3JtYXQsIG5vdCBFTEYuCj4g
Cj4gUmlnaHQsIGJ1dCBJIHRoaW5rIGl0IGlzIGRlc2lyYWJsZSB0byBiZSBhYmxlIHRvIGJ1aWxk
IGJvdGggZnJvbSB0aGUKPiBzYW1lIGNvbmZpZyBmaWxlLgoKQWgsICJtYWtlIGJ6SW1hZ2UiIGFu
ZCB1c2UgdGhlIHZtbGludXggZm9yIFBWSCwgYmVjYXVzZSBQVkggZmV0Y2hlcyB0aGUKZW50cnkg
cG9pbnQgZnJvbSB0aGUgc3BlY2lhbCBub3RlLiAgVGhhdCdzIGNsZXZlci4gOikKCkkgZG9uJ3Qg
c2VlIHdoeSBpdCBzaG91bGQgbm90IHdvcmssIGFuZCBpZiBzbyB0aGUgImRlcGVuZHMgb24gIUVG
SSIgaXMKaW5kZWVkIHVubmVjZXNzYXJ5LgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
