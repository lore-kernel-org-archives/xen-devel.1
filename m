From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] treewide: Lift switch
 variables out of switches
Date: Wed, 23 Jan 2019 16:17:30 +0200
Message-ID: <874l9z31c5.fsf__42314.1856606648$1548253032$gmane$org@intel.com>
References: <20190123110349.35882-1-keescook@chromium.org>
 <20190123110349.35882-2-keescook@chromium.org>
 <20190123115829.GA31385@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jywi=P7=intel.com=jani.nikula@srs-us1.protection.inumbo.net>)
 id 1gmJJs-0000Mg-JW
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 14:15:56 +0000
In-Reply-To: <20190123115829.GA31385@kroah.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>
Cc: dev@openvswitch.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-security-module@vger.kernel.org, intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org, kernel-hardening@lists.openwall.com, linux-fsdevel@vger.kernel.org, Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMyBKYW4gMjAxOSwgR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
IHdyb3RlOgo+IE9uIFdlZCwgSmFuIDIzLCAyMDE5IGF0IDAzOjAzOjQ3QU0gLTA4MDAsIEtlZXMg
Q29vayB3cm90ZToKPj4gVmFyaWFibGVzIGRlY2xhcmVkIGluIGEgc3dpdGNoIHN0YXRlbWVudCBi
ZWZvcmUgYW55IGNhc2Ugc3RhdGVtZW50cwo+PiBjYW5ub3QgYmUgaW5pdGlhbGl6ZWQsIHNvIG1v
dmUgYWxsIGluc3RhbmNlcyBvdXQgb2YgdGhlIHN3aXRjaGVzLgo+PiBBZnRlciB0aGlzLCBmdXR1
cmUgYWx3YXlzLWluaXRpYWxpemVkIHN0YWNrIHZhcmlhYmxlcyB3aWxsIHdvcmsKPj4gYW5kIG5v
dCB0aHJvdyB3YXJuaW5ncyBsaWtlIHRoaXM6Cj4+IAo+PiBmcy9mY250bC5jOiBJbiBmdW5jdGlv
biDigJhzZW5kX3NpZ2lvX3RvX3Rhc2vigJk6Cj4+IGZzL2ZjbnRsLmM6NzM4OjEzOiB3YXJuaW5n
OiBzdGF0ZW1lbnQgd2lsbCBuZXZlciBiZSBleGVjdXRlZCBbLVdzd2l0Y2gtdW5yZWFjaGFibGVd
Cj4+ICAgIHNpZ2luZm9fdCBzaTsKPj4gICAgICAgICAgICAgIF5+Cj4KPiBUaGF0J3MgYSBwYWlu
LCBzbyB0aGlzIG1lYW5zIHdlIGNhbid0IGhhdmUgYW55IG5ldyB2YXJpYWJsZXMgaW4geyB9Cj4g
c2NvcGUgZXhjZXB0IGZvciBhdCB0aGUgdG9wIG9mIGEgZnVuY3Rpb24/Cj4KPiBUaGF0J3MgZ29p
bmcgdG8gYmUgYSBoYXJkIHRoaW5nIHRvIGtlZXAgZnJvbSBoYXBwZW5pbmcgb3ZlciB0aW1lLCBh
cwo+IHRoaXMgaXMgdmFsaWQgQyA6KAoKTm90IGFsbCB2YWxpZCBDIGlzIG1lYW50IHRvIGJlIHVz
ZWQhIDspCgpBbnl3YXksIEkgdGhpbmsgeW91J3JlIG1pc3Rha2luZyB0aGUgbGltaXRhdGlvbiB0
byBhcmJpdHJhcnkgYmxvY2tzCndoaWxlIGl0J3Mgb25seSBhYm91dCB0aGUgc3dpdGNoIGJsb2Nr
IElJVUMuCgpDYW4ndCBoYXZlOgoKCXN3aXRjaCAoaSkgewoJCWludCBqOwoJY2FzZSAwOgogICAg
ICAgIAkvKiAuLi4gKi8KCX0KCmJlY2F1c2UgaXQgY2FuJ3QgYmUgdHVybmVkIGludG86CgoJc3dp
dGNoIChpKSB7CgkJaW50IGogPSAwOyAvKiBub3QgdmFsaWQgQyAqLwoJY2FzZSAwOgogICAgICAg
IAkvKiAuLi4gKi8KCX0KCmJ1dCBjYW4gaGF2ZSBlLmcuOgoKCXN3aXRjaCAoaSkgewoJY2FzZSAw
OgoJCXsKCQkJaW50IGogPSAwOwoJICAgICAgICAJLyogLi4uICovCgkJfQoJfQoKSSB0aGluayBL
ZWVzJyBhcHByb2FjaCBvZiBtb3Zpbmcgc3VjaCB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgdG8gdGhl
CmVuY2xvc2luZyBibG9jayBzY29wZSBpcyBiZXR0ZXIgdGhhbiBhZGRpbmcgYW5vdGhlciBuZXN0
aW5nIGJsb2NrLgoKQlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJj
ZSBHcmFwaGljcyBDZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
