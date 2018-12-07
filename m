From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Fri, 7 Dec 2018 14:50:46 +0100
Message-ID: <3f95d053-87aa-ad45-03e6-1e1977283eb4__42980.2276929424$1544190579$gmane$org@suse.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <2c289956-0e6a-700c-605d-83685fbb08f9@suse.com>
 <0a2f692a-f7df-8ad1-9d34-96f5e36926db@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kC+f=OQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gVGWq-0005vn-6a
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 13:50:52 +0000
In-Reply-To: <0a2f692a-f7df-8ad1-9d34-96f5e36926db@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMjAxOCAxNDo0MSwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAwNy8xMi8xOCAw
NzowMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDYvMTIvMjAxOCAyMzoxMSwgUGFvbG8g
Qm9uemluaSB3cm90ZToKPj4+IE9uIDA2LzEyLzE4IDA3OjA0LCBNYXJhbiBXaWxzb24gd3JvdGU6
Cj4+Pj4gK2NvbmZpZyBQVkgKPj4+PiArCWJvb2wgIlN1cHBvcnQgZm9yIHJ1bm5pbmcgUFZIIGd1
ZXN0cyIKPj4+PiArCS0tLWhlbHAtLS0KPj4+PiArCSAgVGhpcyBvcHRpb24gZW5hYmxlcyB0aGUg
UFZIIGVudHJ5IHBvaW50IGZvciBndWVzdCB2aXJ0dWFsIG1hY2hpbmVzCj4+Pj4gKwkgIGFzIHNw
ZWNpZmllZCBpbiB0aGUgeDg2L0hWTSBkaXJlY3QgYm9vdCBBQkkuCj4+Pj4gKwo+Pj4KPj4+IElJ
VUMgdGhpcyBicmVha3MgIm5vcm1hbCIgYnpJbWFnZSBib290LCBzbyB3ZSBzaG91bGQgaGF2ZSBz
b21ldGhpbmcgbGlrZQo+Pj4KPj4+IAlUaGUgcmVzdWx0aW5nIGtlcm5lbCB3aWxsIG5vdCBib290
IHdpdGggbW9zdCB4ODYgYm9vdCBsb2FkZXJzCj4+PiAJc3VjaCBhcyBHUlVCIG9yIFNZU0xJTlVY
LiAgVW5sZXNzIHlvdSBwbGFuIHRvIHN0YXJ0IHRoZSBrZXJuZWwKPj4+IAl1c2luZyBRRU1VIG9y
IFhlbiwgeW91IHByb2JhYmx5IHdhbnQgdG8gc2F5IE4gaGVyZS4KPj4KPj4gVGhlIHJlc3VsdGlu
ZyBrZXJuZWwgc2hvdWxkIGJlIGFibGUgdG8gYmUgYm9vdGVkIGVpdGhlciBpbiBQVkggbW9kZQo+
PiB2aWEgdGhlIFBWSCBlbnRyeSBwb2ludCBvciB0aGUgIm5vcm1hbCIgd2F5IHZpYSB0aGUgc3Rp
bGwgZXhpc3RpbmcKPj4gb2xkIGVudHJ5IHBvaW50KHMpLgo+Pgo+PiBJdCBpcyBhbiBfYWRkaXRp
b25hbF8gd2F5IHRvIGJvb3QgdGhlIGtlcm5lbCwgbm90IGFuIGV4Y2x1c2l2ZQo+PiBhbHRlcm5h
dGl2ZS4KPiAKPiBZdXAsIHVuZGVyc3Rvb2Qgbm93LiAgRGlmZmVyZW50IGJpbmFyaWVzIGJ1dCBv
bmUgYnVpbGQuCgpUaGUgUFZIIGJvb3QgZW50cnkgaXMgaW4gdGhlIHNhbWUgYnpJbWFnZSBiaW5h
cnkgYXMgdGhlIG5vcm1hbCBvbmUuCkl0cyBqdXN0IGFub3RoZXIgZW50cnksIHNpbWlsYXIgdG8g
dGhlIFhlbiBQViBib290IGVudHJ5LiBTbyB0aGUgYmluYXJ5CmFyY2gveDg2L2Jvb3QvYnppbWFn
ZSBjYW4gYmUgYm9vdGVkIGVpdGhlciBvbiBiYXJlIG1ldGFsIHZpYSBncnViMiBvcgpvdGhlciBi
b290LWxvYWRlcnMsIGFzIFhlbiBQVi1ndWVzdCwgYXMgWGVuIFBWSC1ndWVzdCwgb3IgYXMgS1ZN
ClBWSC1ndWVzdC4gU28gb25lIGJ1aWxkIGFuZCBvbmUgYmluYXJ5LiBUaGUgbm9uLXN0YW5kYXJk
IGJvb3QgZW50cmllcwooUFYtIG9yIFBWSC1ub2RlKSBhcmUgZm91bmQgdmlhIEVMRi1ub3RlcyBi
eSB0aGUgYm9vdCBsb2FkZXIgKHFlbXUgaW4KY2FzZSBvZiBLVk0pLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
