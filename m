From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v1] x86/microcode: always collect_cpu_info()
 during boot
Date: Mon, 1 Apr 2019 21:49:46 +0800
Message-ID: <20190401134944.GA1081@gao-cwp>
References: <20190325111217.25649-1-sergey.dyasli@citrix.com>
 <5C990B220200007800221BB9@prv1-mh.provo.novell.com>
 <b33556d4-5911-d0c6-9663-3e8f4eed79f8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <b33556d4-5911-d0c6-9663-3e8f4eed79f8@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMTE6MTk6MTlBTSArMDEwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPk9uIDI1LzAzLzIwMTkgMTc6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAy
NS4wMy4xOSBhdCAxMjoxMiwgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBD
dXJyZW50bHkgY3B1X3NpZyBzdHJ1Y3QgaXMgbm90IHVwZGF0ZWQgZHVyaW5nIGJvb3Qgd2hlbiBl
aXRoZXI6Cj4+Pgo+Pj4gICAgIDEuIHVjb2RlX3NjYW4gaXMgc2V0IHRvIGZhbHNlIChlLmcuIG5v
ICJ1Y29kZT1zY2FuIiBpbiBjbWRsaW5lKQo+Pj4gICAgIDIuIGluaXRyZCBkb2VzIG5vdCBjb250
YWluIGEgbWljcm9jb2RlIGJsb2IKPj4gCj4+IFdoYXQgYWJvdXQgInVjb2RlPTxudW1iZXI+Ij8K
Pgo+WWVzLCBpdCdzIGVxdWFsbHkgYWZmZWN0ZWQsIEknbGwgdXBkYXRlIHRoZSBjb21taXQgbWVz
c2FnZS4KPgo+Pj4gVGhlc2Ugd2lsbCByZXN1bHQgaW4gY3B1X3NpZy5yZXYgYmVpbmcgMCB3aGlj
aCBhZmZlY3RzIEFQSUMncwo+Pj4gY2hlY2tfZGVhZGxpbmVfZXJyYXRhKCkgYW5kIHJldHBvbGlu
ZV9zYWZlKCkgZnVuY3Rpb25zLgo+Pj4KPj4+IEZpeCB0aGlzIGJ5IGdldHRpbmcgdWNvZGUgcmV2
aXNpb24gZWFybHkgZHVyaW5nIGJvb3QgYW5kIFNNUCBicmluZyB1cC4KPj4gCj4+IENhbid0IHlv
dSB0aGVuIGRyb3AgdGhlIGNhbGwgZnJvbSBtaWNyb2NvZGVfdXBkYXRlX2NwdSgpPwo+Cj5JIHRy
aWVkIHRoaXMgYW5kIGZvdW5kIHRoYXQgcHJvcGVybHkgaGFuZGxpbmcgZXJyb3JzIHJlcXVpcmVz
Cj5hIGNhbGwgdG8gX19taWNyb2NvZGVfZmluaV9jcHUoKS4gQnV0IGluc3RlYWQgb2YgZG9pbmcg
YWxsIHRoaXMKPnJlZmFjdG9yaW5nIG5vdywgSSdkIHByZWZlciB0aGlzIHBhdGNoIHRvIGdvIG9u
IHRvcCBvZiBDaGFvJ3MKPnNlcmllcywgd2hpY2ggZ3JlYXRseSBzaW1wbGlmaWVzIHRoaW5ncyBp
biAicmVtb3ZlIHN0cnVjdAo+dWNvZGVfY3B1X2luZm8iLiBPdGhlcndpc2UsIG1vc3Qgb2YgbXkg
d29yayBoZXJlIHdvdWxkIGJlIHJlbW92ZWQKPmJ5IHRoZSBuZXh0IHZlcnNpb24gb2YgQ2hhbydz
IHNlcmllcy4KPgo+Q2hhbywKPlRvIGhlbHAgbWUgd2l0aCB0aGlzIGRlY2lzaW9uLCB3aGVuIGNh
biB3ZSBleHBlY3QgYSB2NyBvZiB5b3VyCj5zZXJpZXM/CgpXaWxsIHN0YXJ0IHRvIHdvcmsgb24g
djcgZnJvbSB0b21vcnJvdy4gQW5kIEkgaG9wZSB0aGF0IGl0IHdpbGwgYmUgZmluaXNoZWQKaW4g
dGhpcyB3ZWVrLgoKVGhhbmtzCkNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
