From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 6 Dec 2018 23:36:27 +0000
Message-ID: <ba735c9c-5b51-2496-ce07-6fd37eec9d73__18945.3210136437$1544139320$gmane$org@citrix.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <3b4fdddd-67d8-30d3-2a5d-c4d07b6f31c9@oracle.com>
 <e76da394-c721-87ae-c721-1f6efdc93a50@redhat.com>
 <becd5f82-0cca-f74b-93bd-6b4f13bc8bf0@oracle.com>
 <cef985c3-a687-c1af-83ac-2c71af45a366@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YZrh=OP=citrix.com=prvs=871b93375=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gV3C5-0006O5-SK
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 23:36:33 +0000
In-Reply-To: <cef985c3-a687-c1af-83ac-2c71af45a366@redhat.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, rdunlap@infradead.org, jpoimboe@redhat.com, rkrcmar@redhat.com, dave.hansen@linux.intel.com, mingo@redhat.com, luto@kernel.org, hpa@zytor.com, tglx@linutronix.de, bp@suse.de, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAyMzozMCwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAwNy8xMi8xOCAw
MDoxMSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAxMi82LzE4IDU6NDkgUE0sIFBhb2xv
IEJvbnppbmkgd3JvdGU6Cj4+PiBPbiAwNi8xMi8xOCAyMzozNCwgQm9yaXMgT3N0cm92c2t5IHdy
b3RlOgo+Pj4+IE9uIDEyLzYvMTggNToxMSBQTSwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4+Pgo+
Pj4+PiBhbmQgYWxzbwo+Pj4+Pgo+Pj4+PiAJZGVwZW5kcyBvbiAhRUZJCj4+Pj4+Cj4+Pj4+IGJl
Y2F1c2UgZXZlbiB0aG91Z2ggaW4gcHJpbmNpcGxlIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIHdy
aXRlIGEgUFZICj4+Pj4+IGxvYWRlciBmb3IgVUVGSSwgUFZIJ3Mgc3RhcnQgaW5mbyBkb2VzIG5v
dCBzdXBwb3J0IHRoZSBFRkkgaGFuZG92ZXIKPj4+Pj4gcHJvdG9jb2wuCj4+Pj4gQnV0IHdlIHNo
b3VsZCBiZSBhYmxlIHRvIGJ1aWxkIHRoZSBiaW5hcnkgd2l0aCBib3RoIEVGSSBhbmQgUFZIPwo+
Pj4gQ2FuIHlvdT8gIEl0J3MgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBiaW5hcnkgZm9ybWF0LCB0
aGUgRUZJIGhhbmRvdmVyCj4+PiBwcm90b2NvbCBpcyBpbnZva2VkIHZpYSBhIHNwZWNpYWwgZW50
cnkgcG9pbnQgYW5kIG5lZWRzIHRoZSBMaW51eCBoZWFkZXIKPj4+IGZvcm1hdCwgbm90IEVMRi4K
Pj4gUmlnaHQsIGJ1dCBJIHRoaW5rIGl0IGlzIGRlc2lyYWJsZSB0byBiZSBhYmxlIHRvIGJ1aWxk
IGJvdGggZnJvbSB0aGUKPj4gc2FtZSBjb25maWcgZmlsZS4KPiBBaCwgIm1ha2UgYnpJbWFnZSIg
YW5kIHVzZSB0aGUgdm1saW51eCBmb3IgUFZILCBiZWNhdXNlIFBWSCBmZXRjaGVzIHRoZQo+IGVu
dHJ5IHBvaW50IGZyb20gdGhlIHNwZWNpYWwgbm90ZS4gIFRoYXQncyBjbGV2ZXIuIDopCj4KPiBJ
IGRvbid0IHNlZSB3aHkgaXQgc2hvdWxkIG5vdCB3b3JrLCBhbmQgaWYgc28gdGhlICJkZXBlbmRz
IG9uICFFRkkiIGlzCj4gaW5kZWVkIHVubmVjZXNzYXJ5LgoKV2UgZG8gc3RyaXZlIGZvciBzaW5n
bGUgYmluYXJpZXMgaW4gdGhlIFhlbiB3b3JsZCwgYmVjYXVzZSB0aGF0IGlzIGhvdwpwZW9wbGUg
YWN0dWFsbHkgd2FudCB0byBjb25zdW1lIFhlbi4KCkl0IGlzIGZvciB0aGlzIHJlYXNvbiB3aHkg
YSBzaW5nbGUgeGVuLmd6IGJpbmFyeSBjYW4gYmUgbG9hZGVkIGFzIGEKc3RyYWlnaHQgRUxGIChp
bmNsdWRpbmcgdGhpcyBQVkggYm9vdCBwcm90b2NvbCksIG9yIHZpYSBNdWx0aWJvb3QgMSBvcgoy
LCBhbmQgZXZlbiBkbyBmdWxsIEVGSSBpZiB5b3VyIGJvb3Rsb2FkZXIgaXMgdXAgdG8gZGF0ZSBv
biBpdHMKTXVsdGlib290MiBzcGVjIDopCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
