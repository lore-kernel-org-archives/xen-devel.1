From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/xsm: Cleanup in preparation for XSM
 SILO mode
Date: Thu, 16 Aug 2018 06:56:38 -0600
Message-ID: <5B75748602000078001DEE81@prv1-mh.provo.novell.com>
References: <1530011348-4852-1-git-send-email-andrew.cooper3@citrix.com>
 <ea69e94b-ae3e-552e-9dbb-50085bc0f67c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ea69e94b-ae3e-552e-9dbb-50085bc0f67c@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xin Li <xin.li@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Xen-devel <xen-devel@lists.xen.org>, Tim Deegan <tim@xen.org>, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA4LjE4IGF0IDE0OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDYvMTggMTI6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IEZ1dHVyZSBj
aGFuZ2VzIHdpbGwgaW50cm9kdWNlIGEgbmV3IFNJTE8gbW9kZSwgd2hpY2ggaXMgaW50ZW5kZWQg
dG8gYmUgdXNlZnVsCj4+IGZvciBjbG91ZCBhbmQgZW50ZXJwcmlzZSBzZXR1cHMgd2hlcmUgYWxs
IGRvbVVzIGFyZSB1bnByaXZpbGVnZWQgYW5kIGhhdmUgbm8KPj4gYnVpc25lc3MgY29tbXVuaWNh
dGluZyBkaXJlY3RseS4KPj4KPj4gVGhpcyB3YXMgZGlzY3Vzc2VkIGF0IFhlblN1bW1pdCwgYnV0
IEknbGwgbGVhdmUgZnVydGhlciBkZXRhaWxzIHRvIHRoZSBzZXJpZXMKPj4gd2hpY2ggaW50cm9k
dWNlcyBpdC4gIEhvd2V2ZXIsIHRvIGJlZ2luIHdpdGgsIGNsZWFuIHVwIHRoZSBYU00gbmFtZXNw
YWNpbmcgdG8KPj4gYmV0dGVyIHNlcGFyYXRlIFhTTSBhbmQgRkxBU0suCj4+Cj4+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgo+Pgo+PiBBbmRyZXcgQ29vcGVyICgyKToKPj4gICB4ZW4veHNtOiBSZW5h
bWUgQ09ORklHX0ZMQVNLXyogdG8gQ09ORklHX1hTTV9GTEFTS18qCj4+ICAgeGVuL3hzbTogUmVu
YW1lIENPTklGSUdfWFNNX1BPTElDWSB0byBDT05GSUdfWFNNX0ZMQVNLX1BPTElDWQo+IAo+IFBp
bmcgIlRoZSBSZXN0IiBpbiBsaWV1IG9mIERhbmllbC4gIFRoaXMgc2VyaWVzIGlzIGJsb2NraW5n
IHRoZQo+IGZ1bmN0aW9uYWwgWFNNIFNJTE8gd29yay4KCklpcmMgSSBoYWQgZ2l2ZW4gc29tZSBj
b21tZW50cywgcmVnYXJkaW5nIHRoZSAodG9vIGxvbmcpIG5hbWVzLgpUaGUgY2hhbmdlcyBhcmUg
bWVjaGFuaWNhbCBlbm91Z2ggdGhhdCBJIGRvbid0IHRoaW5rIHRoZXJlJ3MKbXVjaCBlbHNlIHRv
IHNheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
