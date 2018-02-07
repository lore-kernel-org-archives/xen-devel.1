From: Prarit Bhargava <prarit@redhat.com>
Subject: Re: [v6,
	3/3] x86/smpboot: Fix __max_logical_packages estimate
Date: Wed, 7 Feb 2018 14:31:02 -0500
Message-ID: <02ccc129-83b5-18e9-de5c-b3eff81a8f22__39865.3087825098$1518031825$gmane$org@redhat.com>
References: <20171114124257.22013-4-prarit@redhat.com>
 <370a7ab2-8f57-b99b-428b-d0b1dfe401e7@invisiblethingslab.com>
 <6fdee802-bf24-7fbb-c95a-a6e0d840fbde@redhat.com>
 <a6bdbf62-3d93-1f5c-6c05-c4c391bc8a9e@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a6bdbf62-3d93-1f5c-6c05-c4c391bc8a9e@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel <xen-devel@lists.xen.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Andi Kleen <ak@linux.intel.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Kan Liang <kan.liang@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>, He Chen <he.chen@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>, Piotr Luc <piotr.luc@intel.com>, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>, Tim Chen <tim.c.chen@linux.intel.com>, Mathias Krause <minipli@googlemail.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wNy8yMDE4IDAyOjI2IFBNLCBTaW1vbiBHYWlzZXIgd3JvdGU6Cj4gUHJhcml0IEJo
YXJnYXZhOgo+PiBPbiAwMi8wNy8yMDE4IDAxOjQ0IFBNLCBTaW1vbiBHYWlzZXIgd3JvdGU6Cgo8
c25pcD4KCj4+PiBUaGlzIGJyZWFrcyBib290aW5nIGFzIFhlbiBQViBkb21haW4gZm9yIG1lLiBU
aGUgcHJvYmxlbSBzZWVtcyB0byBiZQo+Pj4gdGhhdCBuYXRpdmVfc21wX2NwdXNfZG9uZSgpIGlz
IG5ldmVyIGNhbGxlZCBvbiBhIFBWIGRvbWFpbi4gU28KPj4+IF9fbWF4X2xvZ2ljYWxfcGFja2Fn
ZXMgaXMgdW5pbml0aWFsaXplZCBhbmQgdGhpcyBsZWFkcyB0byBhIE5VTEwKPj4+IHBvaW50ZXIg
ZGVyZWZlcmVuY2UgaW4gY29yZXRlbXAuCj4+Pgo+Pgo+PiBJJ2xsIHNlZSBpZiBJIGNhbiBmaWd1
cmUgb3V0IGEgd2F5IHRvIHRlc3QgdGhhdC4KPiAKPiBPaywgdGhhbmtzLiBJZiB5b3UgbmVlZCBz
b21lIGxvZ3MsIG9yIGlmIEkgc2hvdWxkIHRlc3Qgc29tZXRoaW5nIGp1c3QKPiBhc2suCj4gCgpU
aGFua3MsIEkgbWF5IHNlbmQgeW91IGEgcGF0Y2ggb2ZmLWxpc3QgdG8gdGVzdC4KCj4+IERvZXMg
OTQ3MTM0ZDliMDBmCj4+ICgieDg2L3NtcGJvb3Q6IERvIG5vdCB1c2Ugc21wX251bV9zaWJsaW5n
cyBpbiBfX21heF9sb2dpY2FsX3BhY2thZ2VzCj4+IGNhbGN1bGF0aW9uIikgaGVscD8KPiAKPiBO
by4KPiAKClllYWgsIHlvdXIgZGVzY3JpcHRpb24gd2FzIGFic29sdXRlbHkgY29ycmVjdC4gIG5h
dGl2ZV9zbXBfY3B1c19kb25lKCkgaXMgb25seQpjYWxsZWQgZm9yIEhWTSBndWVzdHMgYW5kIG5v
dCBQVi4gIEknbSBnb2luZyB0byB0aGluayBhYm91dCB0aGF0IGFuZCBzZW5kIHlvdSBhCnBhdGNo
IGluIGEgYml0LgoKUC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
