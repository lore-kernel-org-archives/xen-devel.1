From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [RFC Patch v4 2/8] ioreq: bump the number of IOREQ
 page to 4 pages
Date: Thu, 14 Dec 2017 14:50:17 +0000
Message-ID: <d254a2681480497cb6ed9688c2c4c0b2@AMSPEX02CL03.citrite.net>
References: <1512546614-9937-1-git-send-email-chao.gao@intel.com>
 <1512546614-9937-3-git-send-email-chao.gao@intel.com>
 <bce1fdbdcb4942db99ad4455855f5208@AMSPEX02CL03.citrite.net>
 <20171206090213.GA23898@op-computing>
 <5cf06a5713b0402b8ad1d1a69a7d77f0@AMSPEX02CL03.citrite.net>
 <f1f66b3af868410d87e0f6dad4a57116@AMSPEX02CL03.citrite.net>
 <20171207065629.GA49036@op-computing>
 <646776360aa2466eabd8fb9bdcccd8dc@AMSPEX02CL03.citrite.net>
 <20171212010337.GA6727@op-computing>
 <29f1803cb91f44fc86d6832ea44a4f27@AMSPEX02CL03.citrite.net>
 <20171212233918.GA36363@op-computing>
 <b5e1ec23f3b7412d984f0c9aa5ec888e@AMSPEX02CL03.citrite.net>
 <b4c030d86cf54a53b5cad54d1041d988@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b4c030d86cf54a53b5cad54d1041d988@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Chao Gao' <chao.gao@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+DQo+ID4gSG1tLiBUaGF0IGxvb2tzIGxp
a2UgaXQgaXMgYmVjYXVzZSB0aGUgaW9yZXEgc2VydmVyIHBhZ2VzIGFyZSBub3Qgb3duZWQgYnkN
Cj4gPiB0aGUgY29ycmVjdCBkb21haW4uIFRoZSBYZW4gcGF0Y2ggc2VyaWVzIHVuZGVyd2VudCBz
b21lIGNoYW5nZXMgbGF0ZXIgaW4NCj4gPiByZXZpZXcgYW5kIEkgZGlkIG5vdCByZS10ZXN0IG15
IFFFTVUgcGF0Y2ggYWZ0ZXIgdGhhdCBzbyBJIHdvbmRlciBpZg0KPiA+IG1hcHBpbmcgSU9SRVEg
cGFnZXMgaGFzIHNpbXBseSBiZWNvbWUgYnJva2VuLiBJJ2xsIGludmVzdGlnYXRlLg0KPiA+DQo+
IA0KPiBJIGhhdmUgcmVwcm9kdWNlZCB0aGUgcHJvYmxlbSBsb2NhbGx5IG5vdy4gV2lsbCB0cnkg
dG8gZmlndXJlIG91dCB0aGUgYnVnDQo+IHRvbW9ycm93Lg0KPiANCg0KQ2hhbywNCg0KICBDYW4g
eW91IHRyeSBteSBuZXcgYnJhbmNoIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXBl
b3BsZS9wYXVsZHUveGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9pb3JlcTI0Pw0KDQog
IFRoZSBwcm9ibGVtIHdhcyBpbmRlZWQgdGhhdCB0aGUgaW9yZXEgcGFnZXMgd2VyZSBvd25lZCBi
eSB0aGUgZW11bGF0aW5nIGRvbWFpbiByYXRoZXIgdGhhbiB0aGUgdGFyZ2V0IGRvbWFpbiwgd2hp
Y2ggaXMgbm8gbG9uZ2VyIGNvbXBhdGlibGUgd2l0aCBwcml2Y21kJ3MgdXNlIG9mIEhZUEVSVklT
T1JfbW11X3VwZGF0ZS4NCg0KICBDaGVlcnMsDQoNCiAgICBQYXVsDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
