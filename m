From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 03/10] arm64: Add ICV_BPR1_EL1 handler
Date: Thu, 1 Feb 2018 10:55:35 +0000
Message-ID: <75e4ca19-85c0-79d6-73e5-9ae4a4422a62@linaro.org>
References: <20180116154305.19186-1-mjaggi@caviumnetworks.com>
 <20180116154305.19186-4-mjaggi@caviumnetworks.com>
 <359be159-7f32-adc5-3f8e-42e9024df525@linaro.org>
 <f7bd2403-a9cd-c434-80f7-1b5df50cfdde@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f7bd2403-a9cd-c434-80f7-1b5df50cfdde@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, xen-devel@lists.xen.org, marc.zyngier@arm.com, sstabellini@kernel.org, andre.przywara@linaro.org
Cc: manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

SGkgTWFuaXNoLAoKT24gMDEvMDIvMTggMDg6NTcsIE1hbmlzaCBKYWdnaSB3cm90ZToKPiBPbiAw
MS8yNS8yMDE4IDEwOjE0IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIE1hbmlzaCwKPj4K
Pj4gT24gMTYvMDEvMTggMTU6NDIsIG1qYWdnaUBjYXZpdW1uZXR3b3Jrcy5jb20gd3JvdGU6Cj4+
PiBGcm9tOiBNYW5pc2ggSmFnZ2kgPG1hbmlzaC5qYWdnaUBjYXZpdW0uY29tPgo+Pj4KPj4+IEFk
ZCBhIGhhbmRsZXIgZm9yIHJlYWRpbmcvd3JpdGluZyB0aGUgZ3Vlc3QncyB2aWV3IG9mIHRoZSBJ
Q0NfQlBSMV9FTDEKPj4+IHJlZ2lzdGVyLCB3aGljaCBpcyBsb2NhdGVkIGluIHRoZSBJQ0hfVk1D
Ul9FTDIuQlBSMSBmaWVsZC4KPj4KPj4gVGhpcyBjb21taXQgKGFuZCBsaWtlbHkgdGhlIGZvbGxv
d2luZ3MpIGlzIGNvbWluZyBmcm9tIExpbnV4LCByaWdodD8gCj4+IElmIGl0IG1hdGNoZXMgY29t
bWl0IGZyb20gTGludXgsIHRoZW4geW91IG5lZWQgdG8ga2VlcCB0YWdzIGFuZCBwb2ludCAKPj4g
dG8gdGhlIExpbnV4IGNvbW1pdC4gU2VlIGNvbW1pdCA3NzYyYzJkNmY0IGluIFhlbiBhcyBhbiBl
eGFtcGxlIHRvIGhvdyAKPj4gdG8gZG8gaXQuCj4+Cj4+IElmIHlvdSBtYWtlIGNoYW5nZXMgZm9y
IFhlbiwgdGhlbiB3cml0ZSAiQWRhcHRlZCBmb3IgWGVuLi4uIi4KPiBvawo+Pgo+PiBCdXQgbG9v
a2luZyBhdCB0aGUgcGF0Y2ggdGhlIG1ham9yIGRpZmZlcmVuY2UgaXMgeW91IHVzZSBYZW4gY29k
aW5nIAo+PiBzdHlsZS4gVGhlIHJlc3QgaXMgcHJldHR5IG11Y2ggdXNlIFhlbiBuYW1lIGZvciBh
Y2Nlc3MgcmVnaXN0ZXIgYW5kIAo+PiBhZGRpbmcgbWlzc2luZyBkZWZpbmUuCj4+Cj4+IEkgdGhp
bmsgaXQgd291bGQgYmUgYmVuZWZpY2lhbCBmb3IgWGVuIHRvIHJlLXVzZSBMaW51eCBjb2RlLiBU
aGUgCj4+IGNvbXBhdGliaWxpdHkgbGF5ZXIgc2hvdWxkIGJlIHZlcnkgbGltaXRlZC4gU3RlZmFu
byBhbnkgb3BpbmlvbnM/Cj4gU28gd2hlbiB5b3UgbWVhbiBsaW51eCBjb2RlLCB5b3UgcmVmZXIg
dG8gYSBwYXRjaCBvciBpbXBvcnRpbmcgdGhlIGNvZGUgCj4gZmlsZSBmcm9tIGxpbnV4ID8KCklt
cG9ydGluZyB0aGUgY29kZSBmcm9tIExpbnV4LiBBbmQgdGhlbiBhIHBhdGNoIHRvIGFkYXB0IGZv
ciBYZW4gKGl0IApzaG91bGQgYmUgZmFpcmx5IHNtYWxsKS4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
