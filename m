From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/2] xen-block: fix sector size confusion
Date: Wed, 27 Mar 2019 18:20:17 +0000
Message-ID: <3585a316-6349-b89e-99be-799b055594db__36201.0470869549$1553710896$gmane$org@citrix.com>
References: <20190327173206.9065-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kI0R=R6=citrix.com=prvs=9824fb700=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9DAC-0008LX-8Z
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:20:36 +0000
In-Reply-To: <20190327173206.9065-1-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxNzozMiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBYZW4gYmxraWYg
cHJvdG9jb2wgaXMgY29uZnVzaW5nIGJ1dCBkaXNjdXNzaW9uIHdpdGggdGhlIG1haW50YWluZXIK
PiBoYXMgY2xhcmlmaWVkIHRoYXQgc2VjdG9yIGJhc2VkIHF1YW50aXRpZXMgaW4gcmVxdWVzdHMg
YW5kIHRoZSAnc2VjdG9ycycKPiB2YWx1ZSBhZHZlcnRpemVkIGluIHhlbnN0b3JlIHNob3VsZCBh
bHdheXMgYmUgaW4gdGVybXMgb2YgNTEyLWJ5dGUKPiB1bml0cyBhbmQgbm90IHRoZSBhZHZlcnRp
c2VkIGxvZ2ljYWwgJ3NlY3Rvci1zaXplJyB2YWx1ZS4KPgo+IFRoaXMgc2VyaWVzIGZpeGVzIHhl
bi1ibG9jayB0byBhZGhlcmUgdG8gdGhlIHNwZWMuCgpJIHRob3VnaHQgd2UgYWdyZWVkIHRoYXQg
aGFyZGNvZGluZyB0aGluZ3MgdG8gNTEyIGJ5dGVzIHdhcyB0aGUgd3JvbmcKdGhpbmcgdG8gZG8u
CgpJIHdhcyBleHBlY3Rpbmcgc29tZXRoaW5nIGxpa2U6CgoxKSBDbGFyaWZ5IHRoZSBzcGVjIHdp
dGggdGhlIGludGVuZGVkIG1lYW5pbmcsICh3aGljaCBpcyB3aGF0IHNvbWUKaW1wbGVtZW50YXRp
b25zIGFjdHVhbGx5IHVzZSBhbHJlYWR5KSBhbmQgd29udCBjcmlwcGxlIDRrIGRhdGFwYXRocy4K
MikgSW50cm9kdWNlIGEgY29tcGF0aWJpbGl0eSBrZXkgZm9yICJJIGRvbid0IHJlbHkgb24gc2Vj
dG9yLXNpemUgYmVpbmcKNTEyIiwgd2hpY2ggZml4ZWQgaW1wbGVtZW50YXRpb25zIHNob3VsZCBh
ZHZlcnRpc2UuCjMpIFNwZWNpZnkgdGhhdCBiZWNhdXNlIG9mIGJ1Z3MgaW4gdGhlIHNwZWMgd2hp
Y2ggZ290IG91dCBpbnRvIHRoZSB3aWxkLApkcml2ZXJzIHdoaWNoIGRvbid0IGZpbmQgdGhlIGtl
eSBiZWluZyBhZHZlcnRpc2VkIGJ5IHRoZSBvdGhlciBlbmQKc2hvdWxkIGVtdWxhdGUgc2VjdG9y
LXNpemU9NTEyIGZvciBjb21wYXRpYmlsaXR5IHdpdGggYnJva2VuCmltcGxlbWVudGF0aW9ucy4K
CldoYXRldmVyIHRoZSBldmVudHVhbCB3YXkgb3V0LCB0aGUgZmlyc3QgdGhpbmcgd2hpY2ggbmVl
ZHMgdG8gaGFwcGVuIGlzCmFuIHVwZGF0ZSB0byB0aGUgc3BlYywgYmVmb3JlIGFjdGlvbnMgYXJl
IHRha2VuIHRvIGFsdGVyIGV4aXN0aW5nCmltcGxlbWVudGF0aW9ucy4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
