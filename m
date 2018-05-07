From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC XEN PATCH v4 01/41] x86_64/mm: fix the PDX
 group check in mem_hotadd_check()
Date: Mon, 07 May 2018 09:59:45 -0600
Message-ID: <5AF077F102000078001C1619@prv1-mh.provo.novell.com>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20171207101030.22364-2-haozhong.zhang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171207101030.22364-2-haozhong.zhang@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Haozhong Zhang <haozhong.zhang@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, dan.j.williams@intel.com, xen-devel@lists.xen.org, Chao Peng <chao.p.peng@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjEyLjE3IGF0IDExOjA5LCA8aGFvemhvbmcuemhhbmdAaW50ZWwuY29tPiB3cm90
ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
eDg2XzY0L21tLmMKPiBAQCAtMTI5NSwxMiArMTI5NSw4IEBAIHN0YXRpYyBpbnQgbWVtX2hvdGFk
ZF9jaGVjayh1bnNpZ25lZCBsb25nIHNwZm4sIHVuc2lnbmVkIGxvbmcgZXBmbikKPiAgICAgICAg
ICByZXR1cm4gMDsKPiAgCj4gICAgICAvKiBNYWtlIHN1cmUgdGhlIG5ldyByYW5nZSBpcyBub3Qg
cHJlc2VudCBub3cgKi8KPiAtICAgIHNpZHggPSAoKHBmbl90b19wZHgoc3BmbikgKyBQRFhfR1JP
VVBfQ09VTlQgLSAxKSAgJiB+KFBEWF9HUk9VUF9DT1VOVCAtIDEpKQo+IC0gICAgICAgICAgICAv
IFBEWF9HUk9VUF9DT1VOVDsKPiArICAgIHNpZHggPSAocGZuX3RvX3BkeChzcGZuKSAmIH4oUERY
X0dST1VQX0NPVU5UIC0gMSkpIC8gUERYX0dST1VQX0NPVU5UOwoKSSBhZ3JlZSB0aGF0IHJvdW5k
aW5nIHVwIGhlcmUgaXMgYm9ndXMuCgo+ICAgICAgZWlkeCA9IChwZm5fdG9fcGR4KGVwZm4gLSAx
KSAmIH4oUERYX0dST1VQX0NPVU5UIC0gMSkpIC8gUERYX0dST1VQX0NPVU5UOwo+IC0gICAgaWYg
KHNpZHggPj0gZWlkeCkKPiAtICAgICAgICByZXR1cm4gMDsKPiAtCj4gICAgICBzID0gZmluZF9u
ZXh0X3plcm9fYml0KHBkeF9ncm91cF92YWxpZCwgZWlkeCwgc2lkeCk7CgpCdXQgaXNuJ3QgdGhp
cyBvbmUgd3JvbmcgdG9vLCBuZWVkaW5nIGVpZHggKyAxIGFzIGFyZ3VtZW50IGluc3RlYWQ/IEFs
c28KZm9yIHRoZSBmb2xsb3dpbmcgZmluZF9uZXh0X2JpdCgpIHRoZW4/CgpBbHNvIHBsZWFzZSBk
b24ndCBkcm9wIHRoZSBibGFuayBsaW5lIHRoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
