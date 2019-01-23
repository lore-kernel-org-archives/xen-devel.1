From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [Intel-gfx] [PATCH 1/3] treewide: Lift switch
 variables out of switches
Date: Wed, 23 Jan 2019 11:18:02 -0800
Message-ID: <20190123191802.GB15311__9334.65384166397$1548271175$gmane$org@bombadil.infradead.org>
References: <20190123110349.35882-1-keescook@chromium.org>
 <20190123110349.35882-2-keescook@chromium.org>
 <20190123115829.GA31385@kroah.com> <874l9z31c5.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K9Lr=P7=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1gmO2K-000357-MA
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 19:18:08 +0000
Content-Disposition: inline
In-Reply-To: <874l9z31c5.fsf@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dev@openvswitch.org, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-security-module@vger.kernel.org, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, kernel-hardening@lists.openwall.com, linux-fsdevel@vger.kernel.org, Laura Abbott <labbott@redhat.com>, Alexander Popov <alex.popov@linux.com>, linux-kbuild@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDQ6MTc6MzBQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gQ2FuJ3QgaGF2ZToKPiAKPiAJc3dpdGNoIChpKSB7Cj4gCQlpbnQgajsKPiAJY2FzZSAw
Ogo+ICAgICAgICAgCS8qIC4uLiAqLwo+IAl9Cj4gCj4gYmVjYXVzZSBpdCBjYW4ndCBiZSB0dXJu
ZWQgaW50bzoKPiAKPiAJc3dpdGNoIChpKSB7Cj4gCQlpbnQgaiA9IDA7IC8qIG5vdCB2YWxpZCBD
ICovCj4gCWNhc2UgMDoKPiAgICAgICAgIAkvKiAuLi4gKi8KPiAJfQo+IAo+IGJ1dCBjYW4gaGF2
ZSBlLmcuOgo+IAo+IAlzd2l0Y2ggKGkpIHsKPiAJY2FzZSAwOgo+IAkJewo+IAkJCWludCBqID0g
MDsKPiAJICAgICAgICAJLyogLi4uICovCj4gCQl9Cj4gCX0KPiAKPiBJIHRoaW5rIEtlZXMnIGFw
cHJvYWNoIG9mIG1vdmluZyBzdWNoIHZhcmlhYmxlIGRlY2xhcmF0aW9ucyB0byB0aGUKPiBlbmNs
b3NpbmcgYmxvY2sgc2NvcGUgaXMgYmV0dGVyIHRoYW4gYWRkaW5nIGFub3RoZXIgbmVzdGluZyBi
bG9jay4KCkFub3RoZXIgbmVzdGluZyBsZXZlbCB3b3VsZCBiZSBiYWQsIGJ1dCBJIHRoaW5rIHRo
aXMgaXMgT0s6CgoJc3dpdGNoIChpKSB7CgljYXNlIDA6IHsKCQlpbnQgaiA9IDA7CiAgICAgICAg
CS8qIC4uLiAqLwoJfQoJY2FzZSAxOiB7CgkJdm9pZCAqcCA9IHE7CgkJLyogLi4uICovCgl9Cgl9
CgpJIGNhbiBpbWFnaW5lIEtlZXMnIHBhdGNoIG1pZ2h0IGhhdmUgYSBiYWQgZWZmZWN0IG9uIHN0
YWNrIGNvbnN1bXB0aW9uLAp1bmxlc3MgR0NDIGNhbiBiZSByZWxpZWQgb24gdG8gYmUgc21hcnQg
ZW5vdWdoIHRvIG5vdGljZSB0aGUKbm9uLW92ZXJsYXBwaW5nIGxpdmVuZXNzIG9mIHRoZSB2cmlh
YmxlcyBhbmQgdXNlIHRoZSBzYW1lIHN0YWNrIHNsb3RzCmZvciBib3RoLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
