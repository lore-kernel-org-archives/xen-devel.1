From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 7/7] x86/hvm: Drop hvm_{vmx,svm} shorthands
Date: Thu, 30 Aug 2018 19:14:52 -0400
Message-ID: <8155dfed-e90b-c6d0-2205-c5543d9833e9@oracle.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-8-git-send-email-andrew.cooper3@citrix.com>
 <b47d0426-de6d-a042-26d8-db36a6e7e5dc@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b47d0426-de6d-a042-26d8-db36a6e7e5dc@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMzAvMjAxOCAwNzoxMSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA4LzI4
LzIwMTggMDE6MzkgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IEJ5IG1ha2luZyB7dm14LHN2
bX0gaW4gaHZtX3ZjcHUgaW50byBhbiBhbm9ueW1vdXMgdW5pb24gKGNvbnNpc3RlbnQgd2l0aAo+
PiBkb21haW4gc2lkZSBvZiB0aGluZ3MpLCB0aGUgaHZtX3t2bXgsc3ZtfSBkZWZpbmVzIGNhbiBi
ZSBkcm9wcGVkLCBhbmQgYWxsIGNvZGUKPj4gcmVmZXIgdG8gdGhlIGNvcnJlY3RseS1uYW1lZCBm
aWVsZHMuICBUaGlzIG1lYW5zIHRoYXQgdGhlIGRhdGEgaGllcmFjaHkgaXMgbm8KPj4gbG9uZ2Vy
IG9ic2N1cmVkIGZyb20gZ3JlcC9jc2NvcGUvdGFncy9ldGMuCj4+Cj4+IFJlZm9ybWF0IG9uZSBj
b21tZW50IGFuZCBzd2l0Y2ggb25lIGJvb2xfdCB0byBib29sIHdoaWxlIG1ha2luZyBjaGFuZ2Vz
Lgo+Pgo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4KPiBEbyB3ZSBzdGlsbCBzdXBw
b3J0IHByZS00LjYgZ2NjPyAKCk9yIDQuNC42PyBJIGRvbid0IHJlbWVtYmVyLgoKLWJvcmlzCgoK
PiBUaGV5IGhhdmUgYSBidWcgdGhhdCBkb2Vzbid0IGFsbG93Cj4gaW5pdGlhbGl6ZXJzIGZvciBh
bm9ueW1vdXMgc3RydWN0cy91bmlvbnMuIEkgZG9uJ3Qga25vdyB3aGV0aGVyIHdlIGhhdmUKPiBh
bnkgZm9yIHZteC9zdm0sIGJ1dCBJIHRob3VnaHQgSSdkIG1lbnRpb24gdGhpcyBqdXN0IGluIGNh
c2UuCj4KPiBPdGhlciB0aGFuIHRoYXQsIGZvciBTVk0gYml0cyBpbiBwYXRjaGVzIDMsNCw2IGFu
ZCA3Cj4KPiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3Jh
Y2xlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
