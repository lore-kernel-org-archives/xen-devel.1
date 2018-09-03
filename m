From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] xen: Improvements to domain_crash()
Date: Mon, 3 Sep 2018 11:21:02 +0300
Message-ID: <49086557-cc0a-10dd-9a24-ebda8d125cfc@bitdefender.com>
References: <1535643097-12059-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535643097-12059-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gOC8zMC8xOCA2OjMxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZXJlIG9yaWdpbmFs
IHJlYXNvbiBmb3IgdGhpcyBwYXRjaCB3YXMgdG8gZml4IGEgbGl2ZXBhdGNoaW5nIHByb2JsZW07
Cj4gdW5uZWNlc3NlcmlseSBsYXJnZSBsaXZlcGF0Y2hzIGR1ZSB0byB0aGUgdXNlIG9mIF9fTElO
RV9fLgo+IAo+IEEgc2Vjb25kIHByb2JsZW0gaXMgb25lIG9mIGRlYnVnYWJpbGl0eS4gIEEgbnVt
YmVyIG9mIGRvbWFpbl9jcmFzaCgpCj4gaW52b2NhdGlvbnMgaGF2ZSBubyBsb2dnaW5nIGF0IGFs
bCwgYW5kIG51bWJlciBvZiBvdGhlcnMgb25seSBoYXZlIGxvZ2dpbmcKPiB3aGVuIGNvbXBpbGVk
IHdpdGggYSBkZWJ1ZyBoeXBlcnZpc29yLgo+IAo+IENoYW5nZSB0aGUgaW50ZXJmYWNlIHRvIHJl
cXVpcmUgdGhlIGNhbGxlciB0byBwYXNzIGEgcHJpbnRrKCkgbWVzc2FnZSwgd2hpY2gKPiBpcyBl
bWl0dGVkIGF0IGd1ZXN0IGVycm9yIGxldmVsLiAgVGhpcyBzaG91bGQgZW5zdXJlIHRoYXQgZXZl
cnkgdGltZSBhIGRvbWFpbgo+IGlzIGNyYXNoZWQsIGFuIGluZm9ybWF0aXZlIGxvZyBtZXNzYWdl
IGlzIGFsc28gcHJlc2VudC4KPiAKPiBVcGRhdGUgYWxsIGNhbGxlcnMgdG8gZWl0aGVyIG1lcmdl
IHdpdGggYSBwcmV2aW91cyBwcmludGsoKSwgb3IgaW52ZW50IGFuCj4gaW5mb3JtYXRpdmUgbG9n
IG1lc3NhZ2UuICBBIGZldyBzZWxlY3QgY2FsbGVycyBhcmUgc3dpdGNoZWQgdG8gdGhlCj4gbm9u
LXByaW50aW5nIHZlcnNpb24sIHdoZW4gdGhleSd2ZSBhbHJlYWR5IGVtaXR0ZWQgYSByZWxldmVu
dCBzdGF0ZSBkdW1wLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVA
Yml0ZGVmZW5kZXIuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
